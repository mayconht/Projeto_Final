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


wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xvfz node_exporter-0.18.1.linux-amd64.tar.gz
cd node_exporter-0.18.1.linux-amd64/
./node_exporter &
