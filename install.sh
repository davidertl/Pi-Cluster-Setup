#Docker Install 
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh

#Docker Setup
##User permission
sudo groupadd docker
sudo usermod -aG docker $USER
##Autostart Docker
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

#Portainer Setup
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

sudo reboot