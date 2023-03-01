## Rotary Encoder

move this elsewhere -- python-gpio? python-electronics?

```python
import rotary_encoder from components
# switch
# relay


def init():
  

# define ro
def add_event(clk, dt, cw_callback, ccw_callback, btn_callback):
    ...
    cw_callback()
    ccw_callback()
    btn_callback()

# register callback functions
rotary_encoder.set_callbacks(clk, dt, cw_callback=.., ccw_callback=, btn_callback=)
```

