#!/bin/bash
sudo yum update -y
sudo yum install -y docker git curl
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
##################################
#######clone_repo#######
mkdir /home/ec2-user/docker
cd /home/ec2-user/docker
git clone https://github.com/rearc/quest.git
cd /home/ec2-user/docker/quest
###################################
#####build-docker-image########
cat <<EOF > Dockerfile
FROM node:14
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
EOF
docker build -t node-app .
####Create-pod-using-image #######
docker run -d -p 80:3000 --name temp-app node-app
SECRET_WORD=$(curl -s http://localhost | grep -oP '(?<=SECRET_WORD is )\w+')
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker run -d -p 80:3000 --env SECRET_WORD=$SECRET_WORD --name rearc-node node-app
##################################