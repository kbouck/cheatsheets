# Adafruit AHT20 - Temperature and Humidity Sensor



## Example Sketch


```cpp
// I2C ID: 0x38
#include <Adafruit_AHTX0.h>

Adafruit_AHTX0 aht;

void setup() {
  Serial.begin(115200);
  Serial.println("Adafruit AHT10/AHT20 demo!");

  if (! aht.begin()) {
    Serial.println("Could not find AHT? Check wiring");
    while (1) delay(10);
  }
  Serial.println("AHT10 or AHT20 found");
}

void loop() {
  sensors_event_t humidity, temp;
  aht.getEvent(&humidity, &temp); // populate temp and humidity objects with fresh data
  Serial.print("Temperature:"); 
  Serial.print(temp.temperature); 
  Serial.print(",");
  Serial.print("Humidity:");
  Serial.print(humidity.relative_humidity);
  Serial.println();

  delay(500);
}
```



# See Also

- [arduino-i2c-bme680](arduino-i2c-bme680.md)
