FROM debian:bullseye
WORKDIR /usr/app

#Copiem tot a /usr/app
COPY . /usr/app

#Instal·lem curl per poder descarregar el setup de nodejs
RUN apt-get update 
RUN apt-get install -y curl

#Instal·lem nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs

#Descarreguem les dependencies
RUN npm install --omit=dev

#Executem l'aplicació
CMD [ "node", "run.js" ]