FROM debian:bullseye
WORKDIR /usr/app

#Instal·lem curl per poder descarregar el setup de nodejs + nodejs
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash -  && \
    apt-get update  && \
    apt-get install -y nodejs

#Copiem tot a /usr/app
COPY . /usr/app

#Descarreguem les dependencies
RUN npm install

#Executem l'aplicació
CMD [ "node", "index.js" ]