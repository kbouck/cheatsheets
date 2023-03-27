
she'll scripting 

todo: shebang

todo: venv / build to executable?


sh lib

```python

import sh
    names = sh.ls("./src")
    for name in names:
        sh.mv(["./src/" + name, "./dst/" + name + ".out"])

```