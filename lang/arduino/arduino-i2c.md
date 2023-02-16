







```c++
// TwoWire
// TODO

// Send Command
boolean sendCommand(byte command, byte option)
{
    _i2cPort->beginTransmission(_deviceAddress);
    _i2cPort->write(command);
    _i2cPort->write(option);
    if (_i2cPort->endTransmission() != 0)
      return (false); // Sensor did not ACK
    return (true);
}
```





ideas

- i2c bus propagation via serial
  - combine i2c scanner
  - subscribe/snoop to the addresses found
  - write the i2c data to serial
  - an OS process can monitor serial data and write
  - but...
    - Will this include the data that goes into begin transmission?
- 

## i2c scan

- discover i2c addresses on the i2c bus
- code below could be rewritte as a function that returns a list

```c++
#include <Arduino.h>
#include <Wire.h>

void setup() {
  Serial.begin(115200);
  Wire.begin();
}

void loop() {
  byte error, address;
  int nDevices;

  Serial.println("Scanning...");

  nDevices = 0;
  for (address = 1; address < 127; address++) {
    // The i2c_scanner uses the return value of
    // the Write.endTransmisstion to see if
    // a device did acknowledge to the address.
    Wire.beginTransmission(address);
    error = Wire.endTransmission();

    if (error == 0) {
      Serial.print("I2C device found at address 0x");
      if (address < 16)
        Serial.print("0");
      Serial.print(address, HEX);
      Serial.println("  !");

      nDevices++;
    } else if (error == 4) {
      Serial.print("Unknown error at address 0x");
      if (address < 16)
        Serial.print("0");
      Serial.println(address, HEX);
    }
  }
  if (nDevices == 0)
    Serial.println("No I2C devices found\n");
  else
    Serial.println("done\n");

  delay(5000); // wait 5 seconds for next scan
}
```

- there's also a scan function in the "board" or busio module (circuit python?)
- here's the implementation - seems like same approach. iterate through all possible addresses testing for slaves listening
- Note the range of addresses it tests is limited to...
  - 0x08 == 8
  - 0x78 == 120
  - so maybe range above should be given same limit

```c
// 7-bit addresses 0b0000xxx and 0b1111xxx are reserved
for (int addr = 0x08; addr < 0x78; ++addr) {
  bool success = common_hal_busio_i2c_probe(self, addr);
  if (success) {
    mp_obj_list_append(list, MP_OBJ_NEW_SMALL_INT(addr));
  }
}
```





# adh20

```bash



```



# bme680

