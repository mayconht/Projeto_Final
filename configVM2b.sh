red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}Instalando Prometheus${reset}"
wget https://s3-eu-west-1.amazonaws.com/deb.robustperception.io/41EFC99D.gpg | sudo apt-key add -
apt-get update
apt-get install prometheus prometheus-node-exporter prometheus-pushgateway prometheus-alertmanager
service prometheus status