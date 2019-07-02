red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

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
sudo docker-compose ps

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

echo "${green}Instalando Grafana${reset}"
curl https://packagecloud.io/gpg.key | sudo apt-key add -
curl https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt-get update
sudo apt -y install grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
sudo ufw allow proto tcp from any to any port 3000