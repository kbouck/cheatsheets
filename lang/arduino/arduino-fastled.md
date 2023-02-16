







## RGB Data from Serial

from: https://github.com/FastLED/FastLED/wiki/Controlling-leds

```c++
// A "CRGB" is nothing more than a convenient wrapper for three bytes of raw RGB data: one byte of red, one byte of green, and one byte of blue. You are welcome, and invited, to directly access the underlying memory. These examples show how you read binary RGB data directly from a Serial stream into your array of LED values:

// Read a single pixel of RGB data directly into one CRGB (v2).
Serial.readBytes( (char*)(&leds[i]), 3); // read three bytes: r, g, and b.

// Read a whole strip's worth of RGB data directly into the leds array at once (v2)
Serial.readBytes( (char*)leds, NUM_LEDS * 3);
```







## EVERY_N_MILLIS

```c++
// Defined in the FastLED library (lib8tion.h), it is a preprocessor macro which is replaced by a block of code when compiled

// eg. write FPS to serial
EVERY_N_MILLIS(1000) {
  Serial.print("LED FPS: " );
  Serial.println(LEDS.getFPS());
}
```

