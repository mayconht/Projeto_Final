red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}Instalando Uploader Server${reset}"
sudo git clone https://github.com/mayconht/Projeto_Final
cd Projeto_Final
cd UploaderServer
sudo docker build -t uploaderServer:latest .
sudo docker run -v /data/:/var/files/ -d -p 5000:5000 uploaderServer:latest --name="uploaderServer"

echo "${green}Instalando Uploader Client${reset}"
sudo git clone https://github.com/mayconht/Projeto_Final
cd Projeto_Final
cd UploaderClient
sudo docker build -t uploaderClient:latest .
sudo docker run -v /data/:/var/files/ -d -p 5001:5001 uploaderClient:latest --name="uploaderClient"



