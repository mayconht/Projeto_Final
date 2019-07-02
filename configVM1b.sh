red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}Instalando Uploader Server${reset}"
sudo git clone https://github.com/mayconht/Projeto_Final
cd Projeto_Final
cd UploaderServer
sudo docker build -t uploaderserver:latest .
sudo docker run -d -p 5000:5000 uploaderserver:latest

cd ~

echo "${green}Instalando Uploader Client${reset}"
sudo git clone https://github.com/mayconht/Projeto_Final
cd Projeto_Final
cd UploaderClient
sudo docker build -t uploaderclient:latest .
sudo docker run -d -p 5001:5001 uploaderclient:latest 

cd ~

echo "${green}Instalando Prometheus${reset}"
wget https://s3-eu-west-1.amazonaws.com/deb.robustperception.io/41EFC99D.gpg | sudo apt-key add -
apt-get update
apt -y install prometheus prometheus-node-exporter prometheus-pushgateway prometheus-alertmanager
sudo systemctl stop prometheus
sudo chmod -R 777 /etc/prometheus/
cd /etc/prometheus/
sudo rm -rf prometheus.yml
wget https://raw.githubusercontent.com/mayconht/Projeto_Final/master/Prometheus/prometheus.yml
wget https://raw.githubusercontent.com/mayconht/Projeto_Final/master/Prometheus/docker-compose.yml
sudo docker-compose up &

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



