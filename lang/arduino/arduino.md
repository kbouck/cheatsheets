
# boards

| Board              | Size        | Power                    | Chip | Memory |
| ------------------ | ----------- | ------------------------ | ---- | ------ |
| Uno                | Credit Card |                          |      |        |
| Due                | Credit Card |                          |      |        |
| Leonardo           | Credit Card | USB-A-micro, Barrel Jack |      |        |
| Micro              | Thumbdrive  | USB-A-micro              |      |        |
| SparkFun Pro Micro | Thumbdrive  | USB-C                    |      |        |
| Nano 33 BLE        | Thumbdrive  | USB-A (micro)            |      |        |
| Yun                | Credit Card |                          |      |        |
|                    |             |                          |      |        |
|                    |             |                          |      |        |
|                    |             |                          |      |        |
|                    |             |                          |      |        |



# input

## digital pins

https://www.arduino.cc/en/Tutorial/Foundations/DigitalPins

- pins default to input (no need to explicitly declare as INPUT with pinMode)
- pins configured as INPUT with nothing connected to them will report seemingly random changes in pin state, picking up electrical noise from the envionment or capacitively couping the state of a nearby pin.
- a pullup resistor (to +5V) will steer the input pin to a known state if no input is present
- ![image-20220121220100497](/Users/kbouck/Library/Application Support/typora-user-images/image-20220121220100497.png)
- a pulldown resistor (to GND)
- ![image-20220121220044335](/Users/kbouck/Library/Application Support/typora-user-images/image-20220121220044335.png)
- seems better in most every case to use pullup resistors
- 20K pullup resistors are built into the Atmega (INPUT_PULLUP)
- 10K resistor is a good value for a pullup/pulldown resistor
- Stronger pullup (3K or 1K) could futher reduce circuit's susceptibility to noise/interference (noisy env, long leads)
- output pins to other devices should have 470 or 1k ohm resistors (unless max current draw is needed)











```c++
int buttonPin = 0;  // analog pin 0
int buttonPin = 1;  // analog pin 1
int buttonPin = 2;  // analog pin 2

void setup() {
  pinMode(buttonPin0, INPUT);
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
}


# input pins
# ==========
pinMode(pin, INPUT);


# input pins with internal pullup resistor
# ========================================
# good explanation of pullup/pulldown resistors here:
# - http://www.thebox.myzen.co.uk/Tutorial/Inputs.html
#
# pins configured as INPUT with nothing connected to them will report seemingly random changes in pin state, picking up electrical noise from the envionment or capacitively couping the state of a nearby pin.
# when connecting a sensor to pin with INPUT_PULLUP, other end of the sensor should be connected to GND
pinMode(pin, INPUT_PULLUP);    // will read HIGH if off/open/not-pressed/no-input, LOW if on/closed/pressed



# output pins
# ===========
pinMode(pin, OUTPUT);         // low impedence state. can provide substantial current.
```



## button

- most arduino analog pins can be used the same way as digital pins 

```bash
# most analog pins



# debounce input


```



## rotary encoder

```c++
// See Picade notes

// standard approach



// my approach

```



## potentiometer

```c++
int pot1 = 0;
int pot2 = 1;
int pot3 = 2;

void setup() {
  pinMode(pot1, INPUT);
  pinMode(pot2, INPUT);
  pinMOde(pot3, INPUT);
}

void loop() {
	// read analog values (0-1023) from pins
	int analog_value_pot1 = analogRead(pot1);
	int analog_value_pot2 = analogRead(pot2);
	int analog_value_pot3 = analogRead(pot3);

  // convert to byte value (0-255)
  
  // option 1. using map() - not evenly distributed for the extents (0, 255)
  // map(value, fromLow, fromHigh, toLow, toHigh)
  int byte_value_pot1 = map(analog_value_pot1, 0, 1023, 0, 255);
  int byte_value_pot2 = map(analog_value_pot2, 0, 1023, 0, 255);
  int byte_value_pot3 = map(analog_value_pot3, 0, 1023, 0, 255);

  // option 2. just divide by 4 - evenly distributed including the extents
  int byte_value_pot1 = analog_value_pot1 / 4;
  int byte_value_pot2 = analog_value_pot2 / 4;
  int byte_value_pot3 = analog_value_pot3 / 4;
}
```



## thermometer

See:

- [arduino-i2c-aht20](arduino-i2c-aht20.md)
- [arduino-i2c-bme680](arduino-i2c-bme680)

## joystick

```c++
```



## gyroscope

```c++
```



# output

## relay

```c++
```



## PWM / motor

```c++
```



## HID keyboard

```c++
```



## HID mouse

```c++
```

## Built-in LED

flash built-in led:

```c++
void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
  delay(3000);
  digitalWrite(LED_BUILTIN, HIGH);
  delay(100);
  digitalWrite(LED_BUILTIN, LOW);
}
```



# serial

```c++
Serial.begin(9600);
Serial.println(analogValue);

Serial.println(F("some string"));    // F() means constant strings use program/flash memory rather than RAM

```





## I2C

```c++
# get library for each i2c module
# interact with it through the libary
# each library is unique, so take notes for each module on module's own notes page
```





## Zigbee

```c++
```


# Low Power

https://github.com/rocketscream/Low-Power/blob/master/Examples/idleWakePeriodic/idleWakePeriodic.ino

```c++
#include <LowPower.h>


// idle, wake periodic
// ===================

// Enter idle state for 8 s with the rest of peripherals turned off
// Each microcontroller comes with different number of peripherals
// Comment off line of code where necessary

// ATmega328P, ATmega168
LowPower.idle(SLEEP_8S, ADC_OFF, TIMER2_OFF, TIMER1_OFF, TIMER0_OFF, SPI_OFF, USART0_OFF, TWI_OFF);


// ATmega32U4
LowPower.idle(SLEEP_8S, ADC_OFF, TIMER4_OFF, TIMER3_OFF, TIMER1_OFF, TIMER0_OFF, SPI_OFF, USART1_OFF, TWI_OFF, USB_OFF);

// ATmega2560
LowPower.idle(SLEEP_8S, ADC_OFF, TIMER5_OFF, TIMER4_OFF, TIMER3_OFF, TIMER2_OFF, TIMER1_OFF, TIMER0_OFF, SPI_OFF, USART3_OFF, USART2_OFF, USART1_OFF, USART0_OFF, TWI_OFF);

// ATmega256RFR2
LowPower.idle(SLEEP_8S, ADC_OFF, TIMER5_OFF, TIMER4_OFF, TIMER3_OFF, TIMER2_OFF, TIMER1_OFF, TIMER0_OFF, SPI_OFF, USART1_OFF, USART0_OFF, TWI_OFF);


// power down, wake periodic
// ========================

LowPower.powerDown(SLEEP_8S, ADC_OFF, BOD_OFF);  
    


// power down, wake external interrupt 
// ===================================

// Use pin 2 as wake up pin
const int wakeUpPin = 2;

void wakeUp()
{
    // Just a handler for the pin interrupt.
}

void setup()
{
    // Configure wake up pin as input.
    // This will consumes few uA of current.
    pinMode(wakeUpPin, INPUT);   
}

void loop() 
{
    // Allow wake up pin to trigger interrupt on low.
    attachInterrupt(0, wakeUp, LOW);
    
    // Enter power down state with ADC and BOD module disabled.
    // Wake up when wake up pin is low.
    LowPower.powerDown(SLEEP_FOREVER, ADC_OFF, BOD_OFF); 
    
    // Disable external pin interrupt on wake up pin.
    detachInterrupt(0); 
    
    // Do something here
}


## power consumption

- Leonardo
- Micro


```

