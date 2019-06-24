echo "Installing Uploader"
sudo git clone https://github.com/mayconht/Projeto_Final
cd Projeto_Final
cd Uploader
sudo docker build -t uploader:latest .
sudo docker run -d -p 5000:5000 uploader:latest



