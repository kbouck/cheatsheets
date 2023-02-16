

# definitions

```bash
# voltage
- electric potential
- units: V (volt)
- formulas:
  - V = AR       # (voltage = current * resistance)
  - V = J/C      # (voltage = energy / charge)
  - V = W/A      # (voltage = power / current)


# current
- rate of flow of electric charge
- units: A (amp, ampere)
- formulas:
  - A = C/s      # (current = charge / time)
  - I = V/R      # (current = voltage / resistance)


# resistance
- opposition to flow of electric current
- units: Ω (ohm)
- formulas:
  - R = V/I      # (resistance = voltage / current)
                 # aka. ratio of voltage across to current through


# power
- the *rate* at which energy is produced or consumed (energy/work over time).
- units: 
  - W (watt)
  - kW (kilo-watts)
- formulas:
  - W = J/s      # (power = energy / time)
  - P = IV       # (power = current * voltage)
- eg:
  - 1x25A*230V = 5.75kW
  - 1x40A*230V = 9.2kW
  - 3x25A*230V = 17.25kW  <-- likely our most appropriate option
  - 3x35A*230V = 24.15kW


# energy
- unit of *work*
- units:
  - J (joule)
  - Wh (watt-hour)
- formulae:
  - J = CV       # (energy = charge * voltage)
  -              # (energy = power * time)


# charge
- current flow * time
- used to represent battery pack capcity
- units: 
  - Ah, mAh (amp-hours, milliamp-hours)
  - C (coulombs)
- formula: 
  - C = As       # (charge = current * time)
  - Q = It       # (charge = current * time)
  - Q = W/V      # (charge = energy / voltage)
  



```

# power banks / batteries

``` bash

# Anker PowerIQ 3.0
#     Anker's version of Quick Charge 4+. 
#     Both combine USB PD and Quick Charge 3.0 (or PowerIQ 2.0 in Anker's case) 
#     on the same USB-C port.
#
# Anker PowerIQ 2.0 
#     (on the USB-A ports) is Anker's version of Quick Charge 3.0. 
#     Anker's tech is mimicking Qualcomm's tech. So for the most part it is cross-compatible 
#     with Quick Charge and other similar fast charging standards.

# Makita
- 4.0Ah, 18V = 
- 5.0Ah, 18V


# Anker PowerCore Elite III 87W


# Anker PowerCore Elite III 60W - 26K 737 (Series 7) 
- 25600 mAh
- 1x 60W USB-C PD
- 2x 18W USB-A
- Trickle Charge

# Anker PowerCore 26K 537 (Series 5)
- 26800 mAh
- 1x 45W USB-C PD
- 2x 15W USB-A

# Anker PowerCore 19K 535 (Series 5)
- 19200 mAh
- 1x 60W USB-C 
- 2x 12W USB-A
- Trickle-charge 
  - optimized charging to low-power devices such as earphones, Bluetooth speakers
  - press the power button twice or press and hold for 2 seconds until the LED indicator turns green.
  
# Anker PowerCore 10K 533 (Series 5)  
- 10000 mAh
- 1x 18W USB-C
- 1x ?W USB-A
- 1x 10W Wireless Qi

# Anker PowerCore III 19K 45W
- 19200 mAh

```



# power supplies

```bash
# pd buddy
- https://git.clarahobbs.com/pd-buddy
- https://hackaday.io/project/20424-pd-buddy-sink
- https://git.clarahobbs.com/pd-buddy/pd-buddy-firmware/src/branch/master/docs/console_config.md

# enclosure
- https://eclecti.cc/hardware/tiny-usb-type-c-adjustable-power-supply
- https://www.thingiverse.com/thing:2993188/files

# usb power supply project?
- DPS3005 can convert DC 6-40V to DC 0-32V; 
- DPS5005 can convert DC 6-55V to DC 0-50V.


```



# uninterrupted power supply

```bash
APC Easy UPS 500VA
- 120 EUR
APC Easy UPS 650VA
- 145 EUR

APC Easy UPS 700VA
- price: 
- output: 360W (700VA)
- 100W = 15m
- 150W = 7m


800VA
- 157 EUR

900VA
- 

1000VA
- price: 181.49 EUR
- output: 600W (1000VA)

BVX 1200VA

BVX 1600VA


2200VA
- min: 120W - too high


APC BackUPS 325VA
- output: 185W (325VA)
- 100W = 5m
- 150W = 2m

APC BackUPS 400VA
- output ()
- 100W = 23m
- 150W = 13m

APC BackUPS 650VA
- output: 400W (650VA)
- 100W = 26m
- 150W = 15m


APC Back-UPS 850VA
- 
- 100W = 34m
- 150W = 21m
- 200W = 14m

APC Back UPS Pro 900
- price: 411 EUR
- output: 540W (900VA)
- 100W = 58m
- 150W = 36m
https://www.apc.com/shop/nl/en/products/APC-Power-Saving-Back-UPS-Pro-900-900VA-230V-LCD-5-Schuko-CEE-7-outlets-2-surge-/P-BR900G-GR

APC BackUPS Pro 1200
- price: 640 EUR
- output: 720W (1200VA)
- 100W = 1h2m
- 150W = 42m

APC BackUPS Pro 1500 
- price: 676 EUR
- output: 865W (1500VA)
- 100W = 1h2m
- 150W = 42m


```



# power draw

```bash



office desk
============
- mac mini 2018 (desktop) (!! incl. monitor and ext gpu)
  - idle: ~150W (150W * 24h = 3600Wh = 3.6kWh) 3.6kWh * 365 = 
  - 3.6kWh * 0.22 EUR = (0.79 EUR/day) = (24 EUR / mo) = (288 EUR/year)
- mac mini 2018 (desktop) (!! incl. monitor, no ext gpu)
  - idle: 80W
- mac mini 2010 (server)
  - measured: 17W




others:
- arduino leonardo
- mac mini m1
  - idle: 6.8W, 39W under load



bullock cart
============
- estimate:
  - (switch) 60W + (usg) 12W + (fritz) 30W + (pi4) 12.5 + (pi3) 5W + (actiontec) ? + (hue) ?
  - 60+12+30+5 = ~105W
  - 105W * 24 * 365 = 919 kWh/year (estimated) => 202 EUR/year
  - raspberry pi 4: 5V @ 2.5A = 12.5W?
  - unifi-switch-8-poe (60W) - max poe wattach per port 15.4W
  - unifi-usg: 12W
  - fritzbox: 12V*2.5A = 30W
  - hue
  - actiontec moca
  - total: 42W 
  
tv cabinet
==========
- TV-current max: 140W, measured: 100W
- TV-frame max: 170W
- yamaha: 25W
- apple tv: 25W
- total: 150W (everything on)
- total: 20W (everything "off")

kitchen
=======
- old fridge: likely the main user of kitchen electricity - common to use ~1400 kWh/year (so thats EUR 300/year)
- old fridge: ~100W (measured)
- new fridge: 150W (miele: 114kWh/year, grade: D) 1.2A = 264-288W
- oven: infrequent / negligible
- microwave: infrequent / negligible
- dishwasher: 1.1kWh per wash


philips hue lights
==================
- full brightness: 5.4W
- off/idle: 0.4W
- number of lights: 
  - living room: 4+4+3 = 13
  - kitchen: 4+1 = 5
  - office: 4 = 4
  - bedroom: 2 = 2
  - lara: 1+? (led strip)
  - total: 13+5+4+2+1=25
- all on at full brightness: 25*5.4W = 135W
- all off = 25 * 0.4W = 10W
- if left on at full brightness all year long: 135W * 24h = 3.24kWh (3.24kWh * 365 = 1182kWh/year) = 260 EUR/year = 21/mo
- assume not left on all year at full brightness, so likely much less: ~130 EUR/year = 10.8/mo


AC
==
- AP20 = 2.2W  (kW, no?)
- if one left on continuously all year: 20,000 kWh (4400 EUR)
- 9 hours: 613kWh/month (134 EUR/mo)
- summer nights (estimate, outside temp ~20 C):
    - office on, 2 kWh  (0.50 EUR / night)
    - bedroom on, 4? kWh (to be confirmed) (0.88 EUR/night)
    - both on: 6 kWh (1.32 EUR/night)
- winter 
    - hard to calculate as gas heating affects results


totals
======
- 4400 kWh/year (@ 0.22/kWh = 968 EUR/year)
- lights: maybe 500kWh/year ? (theoretical max would be 1182kWh/year if all left on all year long)
- AC: tbd
  - Cooling (summer): 6kWh/night * 60 nights = 360 kWh = 79.2 EUR
  - Heating (winter)
- mini-desktop (and perifs): 1314 kWh/year
- paula-laptop: todo
- tv-cabinet: 150W * 18 * 365 = 985 kWh/year (215 EUR / year)
- servers+bollock card: (42W * 24 * 365 = 367 kWh/year)
- fridge (100W * 24 * 365 = 876 kWh/year)
- oven
- washer: 150-200 kWh/year
- dryer: 3.3 * 220 = 726 kWh/year
- dishwasher (1.1 kWh * 365 =~ 450 kWh/year)

```



# mains

```


our circuit breakers:
- 16A@230V = 3680W
- For continuous load I wouldn't trust the french schuko with more than 13-14A (3000-3200W)
- If you want a socket that can do 16A all day all night you'd need a 16A CEE
- Most sockets are wired with 2.5mm2 solid copper wire
- Most power strips sold for home use have 1.5mm2 stranded wiring (NOT good for a 16A constant load, even though it says 16A on the package)

so:
- limit yourself to 3000w per socket
- 




```

Alright, so. There are various things that will limit the amount of current you can pull through a wall socket. An important factor is the socket itself. These are rated for 16A at 230v, so about 3680W (no idea where people are getting 4000+ watts, they want to kill you). BUT this type of residential plug is not rated for 16A 24/7, only for a short amount of time. Even on new sockets, when you pull 16A through them for hours and hours, they will get warmer and warmer, and might eventually melt. When they wear out and they get looser, dirtier and/or more oxidised, it'll be worse. I've seen this happen with electric/hybrid car chargers, which can pull 16A all day. For continuous load I wouldn't trust the french schuko with more than 13-14A (3000-3200W).  If you want a socket that can do 16A all day all night you'd need a 16A CEE (the blue ones you see at campings etc).

Then there's the wiring, normally sockets are wired with 2.5mm2 solid copper wire, which should be protected by either a 20A automatic breaker or in old installations a 16A melting fuse (lower rating because they're slower and less accurate/predictable than automatics). If the circuit is mixed in with some lights the breaker will be 16A (or 10A when it's an old melty one). So this means that when you have an automatic breaker, you'd technically be able to pull 20A through that single socket (as sockets here do not have individual breakers on them), which I wouldn't recommend. Pulling 10A each from two sockets is better.

Then there's your extension cords and distributors. Most of these sold for home use have 1.5mm2 stranded wiring, which is NOT good for a 16A constant load, even though it says 16A on the package. Only for a short while will it take 16A, a few hours and it will heat up and longer and bad things will happen. I've seen it happen with car chargers. The better ones have 2.5mm2 conductors and can take more, you'll generally find those at building supply stores (look for 2.5mm2 or 3G2.5). The basic home-use ones I wouldn't give more than 2400w continuously.

So to summarise: Try to limit yourself to 3000w per socket. Don't daisy-chain distributors. Check your plugs to make sure they're not getting warm.

Also, all the stuff you mentioned probably won't get you anywhere near 3000, if the lights are LED (because 'some lights' can be anything between a 6w desk light and a few 2000w halogen floodlights), so you should be fine.



