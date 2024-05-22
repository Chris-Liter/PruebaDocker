#Imagen de node para el angular
FROM node:16-alpine as builds
#Area de trabajo
WORKDIR /app
#Copiamos las dependencias
COPY ./Prueba/package.json /app
#Instalamos el npm
RUN npm install
#Copiamos el proyecto entero a /app para su posterior compilacion
COPY ./Prueba/ /app
#Aqui compilamos la aplicacion y generamos el dist para reemplazarlo en /usr/share/nginx/html
RUN npm run build --prod

#Usaremos el nginx 
FROM nginx:latest AS build
#Area de trabajo donde se copiara el dist de angular compilado
WORKDIR /usr/share/nginx/html
#Copiamos el dist
COPY --from=builds /app/dist/Prueba .

#Exponemos el puerto 80 que sera el que se escuchara
EXPOSE 80

#Ejecutamos el nginx
CMD ["nginx", "-g","daemon off;"]
