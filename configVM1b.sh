red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}Instalando Uploader Server${reset}"
sudo git clone https://github.com/mayconht/Projeto_Final
cd Projeto_Final
cd UploaderServer
sudo docker build -t uploaderserver:latest .
sudo docker run -d -p 5000:5000 uploaderserver:latest

ls -l

cd ..
cd ..

ls -l

echo "${green}Instalando Uploader Client${reset}"
sudo git clone https://github.com/mayconht/Projeto_Final
cd Projeto_Final
cd UploaderClient
sudo docker build -t uploaderclient:latest .
sudo docker run -d -p 5001:5001 uploaderclient:latest 

ls -l

cd ..
cd ..

ls -l

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


