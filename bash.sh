#!/bin/bash
sudo apt update -y
sudo apt install openjdk-11-jre -y
sudo apt install maven -y
sudo apt update -y
sudo apt install docker.io -yf
sudo systemctl start docker
sudo systemctl enable dockerjng
sudo git clone https://github.com/gangadhariy/JAVAapp.git
cd JAVAapp
mvn install
mvn package
sudo docker build -t maven .hcg
sudo docker tag maven gangadhariy/jenkinauto
sudo docker login -u gangadhariy -p gang@1112
sudo docker push gangadhariy/jenkinauto
sudo docker run -itd -p 80:8080 gangadhariy/jenkinauto:v1 bash
