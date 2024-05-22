FROM node:16-alpine as builds
WORKDIR /app
COPY ./Prueba/package.json /app
RUN npm install
COPY ./Prueba/ /app

RUN npm run build --prod


FROM nginx:latest AS build
WORKDIR /usr/share/nginx/html

COPY --from=builds /app/dist/Prueba .

EXPOSE 80

#RUN apk add --no-cache nodejs npm
# Comando para iniciar ambos servidores
CMD ["nginx", "-g","daemon off;"]
