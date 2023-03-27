# apt

- debian, ubuntu, pop, raspberry pi 


```bash
sudo apt update                          # update pkg cache metadata
sudo apt upgrade                         # upgrade installed pkgs to latest versions
sudo apt install                         #
sudo apt install -y                      # "", answering yes to prompts
sudo dpkg -i pkg.deb                     # install pkg from file
sudo apt install pkg.deb                 # install pkg from file
sudo apt search <keyword>                # search pkg repo by keyword
sudo apt list                            # list pkg name(s)
sudo apt list <package(s)>               # list pkg name(s) (single line output)
sudo apt info <package>                  # show all pkg metadata

# cache
sudo apt-cache search <keyword>          # search pkg cache by keyword (cache)
sudo apt-cache show <package>            #

# Add repository
echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# OS release upgrade steps
sudo apt update 
sudo apt upgrade                         # might take a while
sudo apt dist-upgrade
sudo apt autoremove
sudo apt install update-manager-core
sudo do-release-upgrade                  # might take a while. wants reboot. after reboot, done.

```

# snap

```bash

```

# yum

- redhat

```bash

```



# dnf

```bash

```


# pacman

```bash

```
 


# yay

```bash

```


# Flathub Store

```bash

```
