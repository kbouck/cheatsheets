




# Debian / Ubuntu

## apt


```bash
# Adding a repository
echo "deb https://packages.grafana.com/enterprise/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list



# OS release upgrade
sudo apt update 
sudo apt upgrade                         # might take a while
sudo apt dist-upgrade
sudo apt autoremove
sudo apt install update-manager-core
sudo do-release-upgrade                  # might take a while. wants reboot. after reboot, done.




```





os upgrade

