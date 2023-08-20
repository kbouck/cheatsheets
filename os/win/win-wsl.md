
# Install 

```bash
wsl --list --verbose         # list available distros
wsl --install                # install default distro
wsl --install Ubuntu         # install specific distro
wsl --unregister Ubuntu      # unregister
```


# Filesystem Interop
```markdown
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
```markdown
# enable wsl -> win
- Go to Firewall Settings
- Advanced Settings
- Properties
- Public Profile
- Customize Protected Network Settings
- Uncheck vEthernet (WSL)



# DNS
- manually adjust /etc/resolv.conf 
  - (works temporarily... still works after restarting wsl?)
  - if not, generation can be suppressed by setting generateResolvConf=false in /etc/wsl.conf
  
  
# hosts
- suppress recreation of hosts file by setting [network] \n generateHosts=false in /etc/wsl.conf



```



