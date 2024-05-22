## Dockerfile 
Lo ejecutaremos con el comando **docker run -d -it -p 4200:80 servidor** y podremos acceder a la pagina de angular subida a la carpeta nginx para poder usar y acceder a el

La direccion en la que se encuentra los archivos de angular es **/usr/share/nginx** y reemplazamos por la carpeta dist que se genera al compilar la aplicacion Angular
Tendremos un docker-compose.yml que permitira gestionar en un volumen para modificaciones de el codigo sin necesidad de volver a Dockerizar la aplicacion.

Se usara una imagen de node para instalar las dependencias de Angular y copiar los datos necesarios de la aplicacion.
Posterior se instalar el **npm** y se realizara un **npm run build --prod** para compilar la aplicacion completa y pasarla a produccion. Generando la carpeta **dist** que contendra a la aplicacion completa.

Luego nos basaremos en una imagen de ubuntu nginx para poder mostrar la pagina web hecha en Angular, donde solo copiaremos la carpeta **dist** dentro de la direccion de **/usr/share/nginx/html** y reemplazaremos los datos por los nuevos.

Ejecutamos la aplicacion y podremos ver la pantalla con **¡Bienvenido a mi servidor Docker con Angular!** escrito en el.

La imagen se encuentra subida a DockerHub: https://hub.docker.com/repository/docker/chrisliter/servidor/general
