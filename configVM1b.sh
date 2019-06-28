red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

echo "${green}Instalando Uploader Server${reset}"
sudo git clone https://github.com/mayconht/Projeto_Final
cd Projeto_Final
cd UploaderServer
sudo docker build -t uploaderserver:latest .
sudo docker run -v /data/:/var/files/ -d -p 5000:5000 uploaderserver:latest --name="uploaderserver"

echo "${green}Instalando Uploader Client${reset}"
sudo git clone https://github.com/mayconht/Projeto_Final
cd ..
cd ..
cd Projeto_Final
cd UploaderClient
sudo docker build -t uploaderclient:latest .
sudo docker run -v /data/:/var/files/ -d -p 5001:5001 uploaderclient:latest --name="uploaderclient"



