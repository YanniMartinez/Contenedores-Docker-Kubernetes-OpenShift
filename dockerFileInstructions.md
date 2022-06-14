# Dockerfile instructions

## FROM
Cualquier Dockerfile valido debe comenzar primero con una instrucción **FROM**, que inicializa una nueva etapa de compilación y especifica la imagen base sobre la que construirá las instrucciones posteriores. Esta imagen base suele ser de un repositorio público, como un sistema operativo o una imagen base para un idioma especifico como GO o Node JS.
Esta imagen base es el inicio para las otras imagenes.


## RUN
Instrucción **RUN**, ejecuta comandos, por ejemplo podemos poner un comando **bash** en una instrucción para correr una tarea especifica. Cada instrucción es una nueva capa añadida por encima de las capas anteriores.

## ENV
El comando **ENV** permite establecer variables de entorno en la imagen.

## ADD & COPY
Los comandos ADD y COPY son similares y permiten copiar archivos en la imagen. Lo podria usar para poner su código de aplicación o ejecutable en su imagen, la principal diferencia es que COPY  solo puede copiar archivos locales y ADD también puede agregar archivos desde direcciones URL remotas.

## CMD
Solo puede haber una instrucción CMD en un Dockerfile, si se incluye más de 1 sólo surtirá efecto el último. El propósito principal de esta instrucción es proporcionar un valor predeterminado para ejecutar un contenedor.
Esta instrucción a menudo define el ejecutable que debe ejecutarse en su contenedor.

* DOCKER INTRUCTIONS:
    - FROM:
        Define base image
    - RUN:
        Execute arbitrary commands
    - ENV
        Set environment variables
    - ADD and COPY
        Copy files and directories
    - CMD
        Define default command for container execution


<img src="dockerFileExample.png"/>