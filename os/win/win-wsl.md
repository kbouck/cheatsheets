
# Install 

```bash
wsl -l --verbose         # list

wsl --install Ubuntu     # install
wsl --unregister Ubuntu  # unregister

```


# Filesystem Interop
```
# Windows files from Linux
/mnt/c/Users/kbouck      # win home
/mnt/c/Users/kbouck/My\ Documents
/mnt/c/Users/kbouck/OneDrive
/mnt/c/Users/kbouck/iCloudDrive


# Linux files from Windows
\\wsl$\Ubuntu
\\wsl$\Ubuntu\tmp
\\wsl$\Ubuntu\home\kbouck

```



# Network Interop
```
# enable wsl -> win
- Go to Firewall Settings
- Advanced Settings
- Properties
- Public Profile
- Customize Protected Network Settings
- Uncheck vEthernet (WSL)
```


