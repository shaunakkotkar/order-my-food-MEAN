FROM ubuntu:20.04 AS base
WORKDIR /app
RUN apt-get update
RUN apt install curl -y
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt -y install nodejs
COPY . .
RUN npm install -g @angular/cli
RUN npm install -g @ionic/cli
RUN npm install
EXPOSE 8080
ENTRYPOINT ["node", "server"]
