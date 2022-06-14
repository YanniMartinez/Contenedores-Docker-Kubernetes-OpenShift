# Introduccion a Contenedores, Kubernetes y OpenShift

## Semana 1
## ¿Que es un contenedor?
Es una unidad ejecutable de software en la que el código de la aplicación se empaqueta junto con sus bibliotecas y dependencias, de manera común para que pueda ejecutarse en cualquier lugar, ya sea en un escritorio local o en la nube. 
Para ello, los contenedores aprovechan una forma de virtualización del sistema operativo en la que se aprovechan las características del sistema operativo para aislar procesos y controlar la cantidad de CPU, memoria y almacenamiento en disco a la que tiene acceso esos procesos.
En el caso del nuclo de Linux, los spacios de nombres **(namespaces)** y **cgroups** son las primitivas del SO que permiten la virtualización. 

Los contenedores son pequeños, rápidos y portátiles porque, a diferencia de una maquina virtual, **no necesitan incluir un sistema operativo invitado en todas las instancias** y pueden simplemente **aprovechar las características** y recursos del sistema operativo host.
Los contenedores aparecieron por primera vez hace mucho tiempo, pero la era moderna de los contenedores comenzó en 2013 con la introducción de Docker.

En resumen un contenedor es:
* Unidad de software ejecutable
    - Encapsulan todo lo necesario para correr
    - Pueden correr en cualquier lugar
* Virtualización del Sistema Operativo (OS)
    - Procesos aislados
    - Control de recursos que alojan a los procesos
* Pequeños, Rápidos y portábles.
    - No necesitan incluir un SO invitado en cada instancia.

*Los contenedores son una estandarización de como empaquetamos y enviamos software, todas las dependencias necesarias para ejecutar una aplicación se empaquetan con ella, lo que facilita moverla y ejecutarla en una variedad de ambientes.*

Los contenedores pueden ejecutar cualquier cosa siempre y cuando pueda empaquetarse como un contenedor. Esta portabilidad es muy util para los desarrolladores, la ventaja frente a las maquinas virtuales es el nivel de abstracción que proporcionan ya que los hacen ligeros y portatiles. Los contenedores son livianos y comparten el núcle del sistema operativo de la maquina, eliminando la necesidad de instancia completa para una aplicación. Su tamaño más pequeño comparado con las maquinas virtuales permiten que gire rápidamente y son más capaces de admitir aplicaciones nativas de la nube las cuales escalan de forma horizontal.

Los contenedores llevan todas sus dependencias consigo mismos por lo que sólo deben configurarse una vez y despues no es necesario configurar en laptops, en la nube o en entornos locales eliminando la preocupación por instalar diferentes dependencias para cada entorno. Gracias a su tamaño ligero y alta escalabilidad permite que los cambios en ellas sean incrementales.

Al igual que las maquinas virtuales, los contenedores le permiten a los desarrolladores y operadores mejorar la utilización del CPU y la memoria. Los contenedores van aún más allá porque también **habilitan una arquitectura de microservicios**, lo que significa que los componentes de la aplicación se pueden implementar y escalar de forma más detallada, esta granularidad proporciona una alternativa atractiva a tener que escalar una aplicacion monolitica completa, por ejemplo cuando solo se carga un componente.


**Beneficios de los contenedores:**

* Ligeros:
    - No incluyen un SO invitado.
    - Giro rápido y escalado horizontal.
* Portable y plataforma independiente
* Ideales para patrones modernos de desarrollo, desarrollo y de arquitectura.
* Mejora en la utilización de recursos.

## Contenedores VS Maquinas Virtuales

**Maquinas virtuales:**
Con las maquinas virtuales, un hipervisor se ejecuta en la parte superior de la infraestructura; este hipervisor es el responsable de crear maquinas virtuales, trata recursos como la CPU y la memoria como un grupo que puede ser utilizado por las diversas maquinas virtuales que se ejecutan en el hardware. En este modelo, el hardware se virtualiza para que varias maquinas con sistemas operativos  potencialmente diferentes para que puedan ejecutarse en el mismo hardware físico. Como se muestra en el diagrama, cada maquina virtual tiene sus propias configuraciones.

|Hipervisor|
|--|
|Maquinas virtuales|

<img src="media/maquinaVirtual.png"/>

**Contenedores**

Encima tenermos el motor de contenedores que igual que el hipervisor es responsable de ejecutar los contenedores. De esta manera, los contenedores virtualizan el sistema operativo en lugar de infraestructura, esto permite que la infraestructura utilice una misma base, permitiendo que los binarios, bibliotecas y aplicaciones se ejecuten en el motor contenedor.

La aplicación no necesita un SO debido a que lo comparten, esto permite que las aplicaciones inicien de una manera muy rápida con muy pocos recurso traduciendose a MegaBytes y en segundos o minutos.

<img src="media/contenedor.png"/>

Hoy en día muchas organizaciones están considerando el uso de contenedores como un reemplazo de maquinas virtuales para tareas de proposito general de aplicaciones y cargas de trabajo.

Los contenedores son una excelente alternativa para arquitecturas basadas en microservicios donde las aplicaciones se construyen con muchos servicios poco acoplados y la combinacion de microservicios y contenedores es una base común para muchos equipos que adoptan DevOps como la forma en que crean, envian y ejecutan el software dado que los contenedores pueden ejecutarse de forma coherente en cualquier lugar, en entornos de portatiles, locales y en la nube dado que son una arquitectura subyacente ideal para escenarios de nube hibrida y multinube debido a que en la mayoria de los casos las organizaciones usan nubes publicas y sus propios centros de datos para la operación. Otra caracteristica muy importante de poner aplicaciones en contenedores es poder migrar a la nube.

En resumen:
* Microservicios:
    - Independientes y deployables servicios.
* DevOps
* Hibrido, multinube.
    - Ejecución consistente atraves de ambientes.



# DOCKER:
Docker es una plataforma de software para crear y ejecutar aplicaciones como contenedores. Docker proporcionó una forma sencilla de construir y ejecutar contenedores a través de una plataforma open source.

<img src="media/docker.png"/>

Docker, la empresa, se basa en las tecnologías de código abierto existentes, contribuye de nuevo a la comunidad para crear nuevas tecnologías. Una de las herramientas más utilizadas de Docker es la interfaz de linea de comandos **CLI** 

## Comandos de Docker

### Docker build
Los desarrolladores proporcionan un **Dockerfile**, un archivo que sirve como **blueprint** para construir una imagen contenedor.
El comando **`docker build`** toma ese archivo y realiza el trabajo pesado para contruir una imagen, el comando tambien *permite a los usuarios etiquetar sus imágenes*, lo que básicamente significa darles un nombre.

### Dockertag
Puede etiquetar imagenes directamente mediante el comando `docker tag`, permite renombrar, o copiar y renombrar una imagen a modo de darle un nuevo nombre.
El comando `tag` no sobreescribirá la imagen existente que tiene en la máquina, creará una nueva etiqueta para la imagen.

### images
El comando `images` enumerará todas las imagenes, sus repositorios y etiquetas y sus tamaños. Una vez que construya o etiqueta una imagen, debe haber una entrada actualizada en la salida de `imagenes acoplables`, esto proporcionará una forma sencilla de verificar que sus comandos `build` y `tag` se ejecutaron correctamente.

### Docker run
Se utiliza para ejecutar un contenedor. Sí está desarrollando imagenes de contenedor y desea probar una imagen que ha desarrollado  puede ejecutarla como contenedor localmente.

### Push
Permite ubicar una imagen en una ubicación remota

### Pull
Permite recuperar una imagen de una ubicación remota.

|Commando|Función|
|--|--|
|`docker build`|Se utiliza para crear imagenes de contenedor, requiere de un docker file|
|`docker tag`|Permite etiquetar imagenes|
|`images`|Listará todas las imagenes, los repositios, etiquetas y sus tamaños|
|`docker run`|Se utiliza para ejecutar un contenedor|
|`push`|Permite almacenar una imagen en una ubicación remota|
|`pull`|Permite recuperar imagenes de una ubicacion remota|

## Runtime

Docker es un motor de ejecución. Un motor de ejecución de contenedor es un software que ejecuta contenedores al igual que el comando **`docker run`**.

## Container Runtime
Los contenedores comparten el sistema operativo.

<img src="media/runtime.png"/>

Docker es probablemente el tiempo de ejecución de contenedores más popular y conocido, pero Docker también ha introducido **el tiempo de ejecución** `containerd` que está ganando popularidad rapidamente.

* Otros: 
Otros tiempos de ejecución como **rkt** también se utilizan en el mercado.


# Building Container Images

## Development of a container
Este diagrama muestra el proceso de desarrollo de un contenedor.


### Dockerfile y blueprint
Un Dockerfile es el **plano** a partir del cual se construye una imagen. A docker file serves as the **blueprint** for an image.
El Dockerfile describe todos los pasos que se deben tomar para construir la imagen deseada; Docker luego construye la imagen.

Una imagen y un contenedor son diferentes aunque también se puede llamar imagen de contenedor. **imagen diferente de contenedor**. 

<img src="media/build1.png"/>

### imagen
Una imagen es un archivo inmutable que contiene el código fuente, las bibliotecas y las dependencia necesarias para que la aplicación corra. Esa inmutabilidad significa que las imagenes son de sólo lectura; si cambia una imagen, creará una nueva imagen. En cierto sentido, las **imagenes son plantillas o blueprints para un contenedor**. También puede pensar que las imagenes son como instantaneas para un contenedor. Por lo tanto, **un contenedor es una imagen en ejecución** 


Dado que las imagenes son de sólo lectura, se coloca una capa de escritura sobre las imagenes para permitir que el contenedor se ejecute.

<img src="media/build2.png"/>


### Relación con POO

Para relacionar esto con la **programación orientada a objetos**, *una imagen de contenedor es como una clase, y un contenedor es un objeto instanciado de esa clase*.

<img src="media/buildFinal.png"/>

Como se muestra en este diagrama, comienza con un **Dockerfile** que indica que incluir en la imagen.

<img src="media/build3.png"/>
<img src="media/buildFinal.png"/>

Estos son los 3 pasos fundamentales.

## Image Layers

Docker puede crear automáticamente imágenes de contenedor mediante las instrucciones de un Dockerfile. `Un Dockerfile es implemente un archivo de texto que contiene todos los comandos que un usuario llamaría en la linea de comandos para crear una imagen`

Docker proporciona un conjunto de instrucciones para todo este proceso.

Las imagenes se construyen capa por capa, con *cada instrucción Docker creando una nueva capa encima de capas existentes*, a medida que se ejecutan las instrucciones de Docker, se crean nuevas capas de sólo lectura para la imagen. *Dependiendo del tamaño de las imagenes ,puede haber algunas capas o muchas* En este caso solo tenemos 4 capas

<img src="media/layer.png"/>

Cuando creamos una instancia de esta imagen, obtenemos un contenedor en ejecución. En este caso se agrega una capa por encima de todas las demás.

<img src="media/layer2.png"/>

Recordemos que los contenedores no son inmutables como las imagenes.
Las capas se pueden compartir entre imagenes, si dos imagenes tienen una capa en común, ambas imagenes dpueden usar esa capa sin tener que volver a crearla, esto puede ahorrar mucho espacio en el disco y ancho de banda de red al enviar y recibir imagenes.

<img src="media/layer3.png"/>

## Dockerfile instructions

### FROM
Cualquier Dockerfile valido debe comenzar primero con una instrucción **FROM**, que inicializa una nueva etapa de compilación y especifica la imagen base sobre la que construirá las instrucciones posteriores. Esta imagen base suele ser de un repositorio público, como un sistema operativo o una imagen base para un idioma especifico como GO o Node JS.
Esta imagen base es el inicio para las otras imagenes.


### RUN
Instrucción **RUN**, ejecuta comandos, por ejemplo podemos poner un comando **bash** en una instrucción para correr una tarea especifica. Cada instrucción es una nueva capa añadida por encima de las capas anteriores.

### ENV
El comando **ENV** permite establecer variables de entorno en la imagen.

### ADD & COPY
Los comandos ADD y COPY son similares y permiten copiar archivos en la imagen. Lo podria usar para poner su código de aplicación o ejecutable en su imagen, la principal diferencia es que COPY  solo puede copiar archivos locales y ADD también puede agregar archivos desde direcciones URL remotas.

### CMD
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

<img src="media/dockerFileInstructions.png"/>

Ejemplo de un DockerFile:

<img src="media/dockerFileExample.png"/>