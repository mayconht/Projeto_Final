red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}Instalando Prometheus${reset}"
sudo git clone https://github.com/mayconht/Projeto_Final
cd Projeto_Final
cd Prometheus
sudo docker build -t my-prometheus .
sudo docker run -p 9090:9090 --restart=always --detach=true --name=prometheus my-prometheus


wget https://github.com/prometheus/node_exporter/releases/download/v*/node_exporter-*.*-amd64.tar.gz
tar xvfz node_exporter-*.*-amd64.tar.gz
cd node_exporter-*.*-amd64
./node_exporter