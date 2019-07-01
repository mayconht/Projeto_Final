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
wget https://github.com/mayconht/Projeto_Final/blob/master/Prometheus/prometheus.yml
sudo systemctl start prometheus
