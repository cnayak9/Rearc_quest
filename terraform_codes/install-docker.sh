#!/bin/bash
yum update -y
yum install -y docker git curl
service docker start
usermod -a -G docker ec2-user

# Clone repo
git clone https://github.com/rearc/quest.git /opt/quest
cd /opt/quest/src

# Build image
cat <<EOF > Dockerfile
FROM node:10
COPY 000.js /app/000.js
WORKDIR /app
CMD ["node", "000.js"]
EOF

docker build -t node-app .

# Start app to fetch SECRET_WORD
#docker run -d -p 8080:8080 --name temp-app node-app
docker run -d -p 80:3000 --name temp-app node-app
sleep 10
#SECRET_WORD=$(curl -s http://localhost:8080 | grep -oP '(?<=SECRET_WORD is )\w+')
SECRET_WORD=$(curl -s http://localhost:80 | grep -oP '(?<=SECRET_WORD is )\w+')

docker stop temp-app
docker rm temp-app

# Run app with SECRET_WORD env
#docker run -d -p 443:8080 --env SECRET_WORD=$SECRET_WORD --name node-app node-app sleep 1000
docker run -d -p 80:3000 --env SECRET_WORD=$SECRET_WORD --name node-app node-app sleep 1000
