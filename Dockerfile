ARG flavour=alpine3.16

FROM node:16.16-alpine3.16 as builder
WORKDIR /usr/app
#Copiem package-lock.json i package.json
COPY package*.json .
#Descarreguem les dependencies
RUN npm install --omit=dev

FROM node:16.16-${flavour} as release
WORKDIR /usr/app
#Copiem source files
COPY index.js .
COPY --from=builder /usr/app/node_modules .
#Executem l'aplicació
CMD [ "node", "src/run.js" ]