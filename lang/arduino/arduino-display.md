






# SSD1306


```c++
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>


void setup() {
  // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }

  // Show initial display buffer contents on the screen --
  // the library initializes this with an Adafruit splash screen.
  display.display();
}


```




## text

```c++
display.setTextSize(2);                // Normal 1:1 pixel scale
display.setTextColor(SSD1306_WHITE);   // Draw white text
display.setCursor(0,0);                // Start at top-left corner
display.println(F("Rainbow"));
char buffer[20];
sprintf(buffer, "The %11s", "hi there");
display.println(buffer);
```





## display buffer

```c++
display.clearDisplay();      // Clear display buffer
display.display();           // Show display buffer
```



## colors

```bash
SSD1306_WHITE
SSD1306_INVERSE
```



## shapes

```c++
// pixel
display.drawPixel(10, 10, SSD1306_WHITE);

// line
display.drawLine(0, 0, i, display.height()-1, SSD1306_WHITE);

// rectangle
display.drawRect(i, i, display.width()-2*i, display.height()-2*i, SSD1306_WHITE);
display.fillRect(i, i, display.width()-i*2, display.height()-i*2, SSD1306_INVERSE);

// cicle
display.drawCircle(display.width()/2, display.height()/2, i, SSD1306_WHITE);
display.fillCircle(display.width() / 2, display.height() / 2, i, SSD1306_INVERSE);

// round rect
display.drawRoundRect(i, i, display.width()-2*i, display.height()-2*i, display.height()/4, SSD1306_WHITE);
display.fillRoundRect(i, i, display.width()-2*i, display.height()-2*i, display.height()/4, SSD1306_INVERSE);

// triangle
display.drawTriangle(
  display.width()/2  , display.height()/2-i,
  display.width()/2-i, display.height()/2+i,
  display.width()/2+i, display.height()/2+i, SSD1306_WHITE);

// bitmap
static const unsigned char PROGMEM logo_bmp[] =
{ 0b00000000, 0b11000000,
  0b00000001, 0b11000000,
  0b00000001, 0b11000000,
  0b00000011, 0b11100000,
  0b11110011, 0b11100000,
  0b11111110, 0b11111000,
  0b01111110, 0b11111111,
  0b00110011, 0b10011111,
  0b00011111, 0b11111100,
  0b00001101, 0b01110000,
  0b00011011, 0b10100000,
  0b00111111, 0b11100000,
  0b00111111, 0b11110000,
  0b01111100, 0b11110000,
  0b01110000, 0b01110000,
  0b00000000, 0b00110000 };

display.drawBitmap(
  (display.width()  - LOGO_WIDTH ) / 2,
  (display.height() - LOGO_HEIGHT) / 2,
  logo_bmp, LOGO_WIDTH, LOGO_HEIGHT, 1);



```

