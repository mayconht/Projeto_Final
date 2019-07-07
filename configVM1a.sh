red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
echo "${red}Este Programa foi criado pelo: ${green}Grupo 4 ${reset}"

echo "${green}Installing Docker${reset}"
sudo apt update
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo apt -y install docker-compose
sudo usermod -aG docker $USER
sudo systemctl start docker

cd ~

sudo git clone https://github.com/mayconht/Projeto_Final

echo "${green}Instalando Uploader Server${reset}"
cd Projeto_Final
cd UploaderServer
sudo docker build -t uploaderserver:latest .
sudo docker run --name UploaderServer --restart always -d -p 5000:5000 uploaderserver:latest

cd ~

echo "${green}Instalando Uploader Client${reset}"
cd Projeto_Final
cd UploaderClient
sudo docker build -t uploaderclient:latest .
sudo docker run  --name UploaderClient --restart always -d -p 5001:5001 uploaderclient:latest 

cd ~

echo "${green}Instalando DockerGetInfo Client${reset}"
cd Projeto_Final
cd DockerDatabase
sudo docker build -t dockerdatabase:latest .
sudo docker run  --name DockerDatabase --restart always -d -p 27017:27017 dockerdatabase:latest 

cd ~

echo "${green}Instalando VMGetInfo Client${reset}"
cd Projeto_Final
cd VmDatabase
sudo docker build -t vmdatabase:latest .
sudo docker run  --name VmDatabase --restart always -d -p 27017:27017 vmdatabase:latest

cd ~

echo "${green}Instalando o Node Exporter${reset}"
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xvfz node_exporter-0.18.1.linux-amd64.tar.gz
sudo mv node_exporter-0.18.1.linux-amd64/node_exporter /usr/local/bin/
sudo useradd -rs /bin/false node_exporter
sudo chmod -R 777 /etc/systemd/system/
cd /etc/systemd/system/
wget https://raw.githubusercontent.com/mayconht/Projeto_Final/master/Prometheus/node_exporter.service
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter

cd ~

echo "${green}Instalando o cadvisor Exporter${reset}"
sudo docker run --restart always \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  --name=cadvisor-VM1 \
  google/cadvisor:latest
