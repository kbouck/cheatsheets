# Bosch BME680 - Temp, Pressure, Humdity, Gas Sensor Module

```c++

#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BME680.h>

#define SEALEVELPRESSURE_HPA (1013.25)

Adafruit_BME680 bme;    // I2C api

void setup()
  while (!connected) {
    if (!bme.begin(0x76)) {
      Serial.println("Could not find a valid BME680 sensor, check wiring!");
    } else {
      Serial.println("Connected.");
      connected = true;
    }
    delay(1000);
  }

  // Oversampling and filter initialization
  bme.setTemperatureOversampling(BME680_OS_8X);
  bme.setHumidityOversampling(BME680_OS_2X);
  bme.setPressureOversampling(BME680_OS_4X);
  bme.setIIRFilterSize(BME680_FILTER_SIZE_3);
  bme.setGasHeater(320, 150); // 320*C for 150 ms
}

void loop() {
  if (! bme.performReading()) {
    Serial.println("Sensor unreachable...");
    
  } else {
    Serial.print("Temperature:");
    Serial.print(bme.temperature);
    Serial.print(", ");
    //Serial.println(" Temperature (C)");

    Serial.print("Pressure:");
    Serial.print(bme.pressure / 100.0);
    Serial.println();
    //Serial.println(" Pressure (hPa)");
  }
}

```

# See Also

- [arduino-i2c-aht20](arduino-i2c-aht20.md)
