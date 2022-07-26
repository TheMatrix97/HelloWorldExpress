FROM debian:bullseye

WORKDIR /usr/app
COPY . /usr/app

RUN apt-get update 
RUN apt-get install -y curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs

RUN npm install


CMD [ "node", "index.js" ]