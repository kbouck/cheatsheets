
# apple

You can change mappings of `ctrl`, `fn`, `option` keys (PC keyboard mappings) by creating 

```bash
/etc/modprobe.d/hid_apple.conf
```

and recreating grub config. All available modifications could be found here: https://github.com/free5lot/hid-apple-patched


```bash
# /etc/modprobe.d/hid_apple.conf
options hid_apple swap_fn_leftctrl=1
options hid_apple swap_opt_cmd=1
```