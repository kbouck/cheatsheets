# build to executable

## favorites

- pyinstaller
- ...

## pyinstaller

- zips compiled python bytecode into executable archive
- at runtime, extracts executable archive to temp dir, runs and imports modules from filesystem
- includes own python interpreter

```bash
pyinstaller cli.py --onefile           # produce single executable file
```

## PyOxidizer

- builds all packages from scratch, links into single file
- runs directly, so faster execution than pyinstaller
- includes own python interpreter

```bash

```

## py2exe

- windows only

```bash

```

## py2app

- macOS only

```bash

```

## cx_Freeze

```bash

```

## Shiv

- just like pex
- requires target system to have python executable

```bash

```

## PEX

- just like shiv
- requires target system to have python executable

```bash

```

## XAR

- linux only
- requires SquashFS

```bash

```

## Nuitka

```bash

```

## PyRun

```bash

```

## pynsist

```bash
```



