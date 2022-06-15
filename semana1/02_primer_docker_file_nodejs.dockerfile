#Pasos para crear una imagen que ejecutará una aplicación node.js
FROM node:9.4.0-alpine
COPY app.js .
COPY package.json .
RUN npm install &&\ 
    apk update &&\
    apk upgrade
CMD node app.js

#Asumiendo que hemos escrito esta aplicación y los archivos existen, 
#podemos utilizar el Dockerfile.

#Ejecución: docker build -t my-app:v1.

#Creando otra tag: docker tag my-app:v1 second-app:v1

#Running the app: docker run my-app:v1

#PUSH: docker push my-app:v1

