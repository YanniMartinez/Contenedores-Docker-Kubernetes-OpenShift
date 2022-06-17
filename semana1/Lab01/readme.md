# Laboratorio

docker --version Verifica que el docker CLI está instalado

ibmcloud version verifica que IBM CLOUD está instalado

[ ! -d 'CC201' ] && git clone https://github.com/ibm-developer-skills-network/CC201.git Clonando el repo

cd CC201/labs/1_ContainersAndDocker/ cambiando directorio

ls listando elementos

docker images Deberia estár vacio

docker pull hello-world Haciendo pull de hello-word

docker images ahora se verá la imagen

docker run hello-world saldrá la ejecución

```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/

```

docker ps -a para ver si corrií bien

docker container rm <container_id> eliminando el contenedor

docker ps -a listamos las imagenes de nuevo

docker build . -t myimage:v1 Ejecutando la imagen

docker images listar las imagenes, veremos la ultima que etiquetamos

docker run -p 8080:8080 myimage:v1 Correr el contenedor con el comando, esto hará que nuestra app escuche el puerto 8080 en otra terminal mandamos peticiones

curl localhost:8080

docker stop $(docker ps -q) pasa por el cleinte la lista de contenedores que se están ejecutando

docker ps verifica que se detuvo el contenedor

ibmcloud target enviando la imagen

ibmcloud cr namespaces ver namespaces a los que tenemos accesos:

ibmcloud cr region-set us-south verificamos la region us-suth

ibmcloud cr login Logeando el Docker Daemon

export MY_NAMESPACE=sn-labs-$USERNAME creacion de variable de entorno

docker tag myimage:v1 us.icr.io/$MY_NAMESPACE/hello-world:1 etiquetando la imagen para hacer un push al container registry

docker push us.icr.io/$MY_NAMESPACE/hello-world:1 haciendo push

ibmcloud cr images verifica si el push se hizo correctamente

ibmcloud cr images --restrict $MY_NAMESPACE lista las imagenes del container registry

