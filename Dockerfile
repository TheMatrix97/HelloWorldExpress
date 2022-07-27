# syntax=docker/dockerfile:1
ARG flavour=alpine3.16

FROM node:16.16-${flavour} as builder
WORKDIR /usr/app
#Copiem package-lock.json i package.json
COPY package*.json .
#Descarreguem les dependencies
RUN npm install --omit=dev

FROM node:16.16-${flavour} as release
USER node
WORKDIR /usr/app    
#Copiem source files
COPY --chown=node src ./src
COPY --chown=node --from=builder /usr/app/node_modules ./node_modules
EXPOSE 3000
#Executem l'aplicació
CMD [ "node", "src/run.js" ]

FROM node:16.16-${flavour} as test
WORKDIR /usr/app
COPY package*.json .
#Copiem source and test files
RUN npm install
COPY test ./test
COPY src ./src
#Executem els tests
CMD [ "npm", "run", "test" ]