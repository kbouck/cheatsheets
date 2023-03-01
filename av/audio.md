

# audio levels

```markdown

Level
=====       
mic              0.001V-0.01V (1mV-10mV) -60 dBV to -40 dBV
instrument
aux level        0.3V / -10 dBV
line level
speaker level


Decibels    Voltage    Level
========    ========   =====
+20dBV      10.0000V   
 +4dBV       1.2000V   line (pro) 
  0dBV       1.0000V     
-10dBV       0.3160V   line (consumer)
-20dBV       0.1000V
             0.0230V   mic (high output)
-40dBV       0.0100V   
             0.0025V   mic (low output)
-60dBV       0.0010V   
-80dBV       0.0001V
```

# converting levels

line->mic

- reduction of about 50dB
- device that does this is called an attenuator or “pad”
- passive device so it does not require a battery or power source. 

mic->line

- A mic level signal must be amplified to bring it up to line level.
- This can be done by a microphone preamplifier or “mic preamp”, which requires a battery or other power source to operate. An audio mixer usually has mic preamps built into some of its input channels.