



# BLE concepts

- **central** - clients that read data from peripherals. Can perform following operations with characteristics:
  - **read** - ask peripheral to send back characteristic value. used for characteristics that don't change very often (config, version numbers)
  - **write** - modify the value of the characteristic - used for commands like turning motor on and off.
  - **indicate and notify** - ask peripheral to continuously send updated values, without needing to constantly ask
- **peripheral** - servers that provide readable sensor data, or read-writable controls (motors, lights, etc) 
- **service** - peripherals provides one or more services, identified by uuid. custom or standard
  - standard numbers: https://www.bluetooth.com/specifications/assigned-numbers/
- **characteristic** - a value (of up to 512 bytes) 
  - can be a single ascii-encoded value (most expensive, longest to read)
  - can be muliple values combined into a single characteristics:
    - motor speed, direction: 150,1 
    - temperature, humidity, pressure: 



**GAP** - general advertising packet 

- device name
- other info
- list of services provided (by uuid)

**GATT** - general attribute profile

- layer that defines services and characteristics, and enables read/write/notify/indicate on them

# ArduinoBLE library

```c++
BLE                    // used to enable the BLE module
BLEDevice              // used to get information and devices connected or discovered while scanning
BLEService             // used to enable or interact with services
BLECharacteristic      // used to enable or interact with characteristics
BLEDescriptor          // used to describe characteristics the board offers
```



## Environment

```c++
TODO - maybe offer calibration as an updatable service, which stores to eeprom?
  managed to save persistent state on Nano 33 BLE using the FlashIAPBlockDevice.
  I found an example where they initiate the device to the upper half the flash memory using parameters   0x80000, 0x80000
   https://github.com/tjpetz/BLESenseFlash
  It’s also worth noting this is not the same as EEPROM emulation, as the Non-Volatile Memory Controller from Nordic is used at the hardware layer, and there is nothing to prevent this memory from being overwritten by the next flash of the device.

It is written in such a way that you define a const variable in code, then using the location of the variable, call operations which overwrite the page which contains the variable. The variable is sized to consume the whole page, and the page alignment is used to ensure that variable starts at the beginning of a page of memory.

#include <ArduinoBLE.h>
//#include <Arduino_HTS221.h>
//#include <Arduino_LPS22HB.h>
//#include <Arduino_APDS9960.h>


const int UPDATE_FREQUENCY = 2000;     // Update frequency in ms
const float CALIBRATION_FACTOR = –4.0; // Temperature calibration factor (Celsius)

int previousTemperature = 0;
unsigned int previousHumidity = 0;
unsigned int previousPressure = 0;
long previousMillis = 0; // last time readings were checked, in ms




// GATT Environment Sensing Service          0x181A
//   Temperature Characteristic              0x2A6E
//   Humidity Characteristic                 0x2A6F
  
BLEService environmentService("181A");   // Standard Environmental Sensing service
BLEIntCharacteristic tempCharx("2A6E",   // Standard 16-bit Temperature characteristic
                   BLERead | BLENotify); // Remote clients can read and get updates

BLEUnsignedIntCharacteristic humidCharx("2A6F", // Unsigned 16-bit Humidity characteristic
                           BLERead | BLENotify);

BLEUnsignedIntCharacteristic pressureCharx("2A6D",  // Unsigned 32-bit Pressure characteristic
                              BLERead | BLENotify); // Remote clients can read and get updates



void setup() {
  
  // Initialize sensors
  // TODO
  
  pinMode(LED_BUILTIN, OUTPUT); // Initialize the built-in LED pin

  if (!BLE.begin()) { // Initialize NINA B306 BLE
    Serial.println("starting BLE failed!");
    while (1); // Guess this means end the program
  }

  BLE.setLocalName("ArduinoNano33BLESense");    // Set name for connection
  BLE.setAdvertisedService(environmentService); // Advertise environment service

  environmentService.addCharacteristic(tempCharacteristic);     // Add temperature characteristic
  environmentService.addCharacteristic(humidCharacteristic);    // Add humidity characteristic
  environmentService.addCharacteristic(pressureCharacteristic); // Add pressure characteristic

  BLE.addService(environmentService); // Add environment service

  tempCharacteristic.setValue(0);     // Set initial temperature value
  humidCharacteristic.setValue(0);    // Set initial humidity value
  pressureCharacteristic.setValue(0); // Set initial pressure value

  BLE.advertise(); // Start advertising
  Serial.print("Peripheral device MAC: ");
  Serial.println(BLE.address());
  Serial.println("Waiting for connections…");
}



void loop() {
    BLEDevice central = BLE.central(); // wait for a central to connect

    // If central is connected to peripheral
    if (central) {
        Serial.print("Connected to central MAC: ");
        Serial.println(central.address()); // Central's BT address:
        digitalWrite(LED_BUILTIN, HIGH); // Turn on the LED to indicate connection

        while (central.connected()) {
            long currentMillis = millis();
            // After UPDATE_FREQUENCY ms have passed, check temperature & humidity
            if (currentMillis – previousMillis >= UPDATE_FREQUENCY) {
                previousMillis = currentMillis;
                updateReadings();
            }
        }

        digitalWrite(LED_BUILTIN, LOW); // When the central disconnects, turn off the LED
        Serial.print("Disconnected from central MAC: ");
        Serial.println(central.address());
    }
}
      
      
int getTemperature(float calibration) {
    // Get calibrated temperature as signed 16-bit int for BLE characteristic
    return (int) (HTS.readTemperature() * 100) + (int) (calibration * 100);
}

unsigned int getHumidity() {
    // Get humidity as unsigned 16-bit int for BLE characteristic
    return (unsigned int) (HTS.readHumidity() * 100);
}

unsigned int getPressure() {
    // Get humidity as unsigned 32-bit int for BLE characteristic
    return (unsigned int) (BARO.readPressure() * 1000 * 10);
}      
      
      
void updateReadings() {
    int temperature = getTemperature(CALIBRATION_FACTOR);
    unsigned int humidity = getHumidity();
    unsigned int pressure = getPressure();
    getColor();

    if (temperature != previousTemperature) { // If reading has changed
        Serial.print("Temperature: ");
        Serial.println(temperature);
        tempCharacteristic.writeValue(temperature); // Update characteristic
        previousTemperature = temperature;          // Save value
    }

    if (humidity != previousHumidity) { // If reading has changed
        Serial.print("Humidity: ");
        Serial.println(humidity);
        humidCharacteristic.writeValue(humidity);
        previousHumidity = humidity;
    }

    if (pressure != previousPressure) { // If reading has changed
        Serial.print("Pressure: ");
        Serial.println(pressure);
        pressureCharacteristic.writeValue(pressure);
        previousPressure = pressure;
    }
```



