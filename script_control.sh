#!/bin/bash

echo ""
echo "___________BIENVENIDO AL MENÚ DOCKER ver.33___________"
echo ""
echo "Este menú se ejecutara de manera infinita hasta que decidas salir de él con la opción 7. Este menú sirve para trabajar en la creación, eliminación arranque, parada y creación de contenedores e imágenes para DOCKER"
echo ""

contador=0
parada=1

until [ $contador -eq $parada ]
do

echo ""
echo ""
echo "IMÁGENES EXISTENTES"
echo ""
docker images 
echo ""
echo ""
echo "CONTENEDORES EXISTENTES"
echo ""
docker ps -a
echo ""
echo ""
echo "CONTENEDORES EN EJECUCIÓN"
echo ""
docker ps 
echo ""
echo ""

read -rep $'Elige lo que quieres hacer \n1.Iniciar Contenedor.\n2.Parar Contenedor.\n3.Crear Contenedor.\n4.Borrar Contenedor.\n5.Crear Imágen.\n6.Borrar Imágen.\n7.SALIR. --> ' eleccion
echo ""
case $eleccion in
		
	1)
		echo "Contenedores existentes"
		echo ""
		docker ps -a
		echo ""
		echo "Contenedores corriendo"
		echo ""
		docker ps
		echo ""
	read -rep $'Pon los 3 primeros caracteres del ID que quieres iniciar: ' ID
		echo ""
		docker start $ID  
		echo ""
		echo "Contenedor iniciado" 
		echo ""
	;;
	
	2)
		echo "Contenedores existentes"
		echo ""
		docker ps -a
		echo ""
		echo "Contenedores corriendo"
		echo ""
		docker ps
		echo ""
	read -rep $'Pon los 3 primeros caracteres del ID que quieres parar: ' ID2
		echo ""
		docker stop $ID2  
		echo ""
		echo "Contenedor parado" 
		echo ""
	;;
	
	3)
		echo "Contenedores existentes"
		echo ""
		docker ps -a
		echo ""
		echo "Contenedores corriendo"
		echo ""
		docker ps
		echo ""
		echo "WARNING: Para hacer este paso tienes que tener una imagen
ya creada o usar una imagen válida" 
		echo ""
		echo "Para poner correctamente el nombre de la imagen, debes
poner [nombre_repositorio:tag]"
		echo ""
		docker images
		echo ""
	read -rep $'Como quieres que se llame tu contenedor?' n_contenedor
	read -rep $'Qué puertos quieres mapear?' n_puertos
	read -rep $'Como se llama la imagen para tu contenedor?' n_imagen
		echo ""
		docker run --name $n_contenedor -p $n_puertos -d $n_imagen 
		echo ""
		echo "Contenedor creado" 
		echo ""
	;;
	
	4)
		echo "Contenedores existentes"
		echo ""
		docker ps -a
		echo ""
		echo "Contenedores corriendo"
		echo ""
		docker ps
		echo ""
		echo "WARNING: Para poder borrar contenedores antes necesitas pararlos"
		echo ""
	read -rep $'Pon los 3 primeros caracteres del ID que quieres borrar: ' ID3
		echo ""
		docker rm $ID3 
		echo ""
		echo "Contenedor borrado" 
		echo ""
	;;
	
	5)
	read -rep $'Pon el nombre que la vas a dar a tu repositorio: ' nom_imagen
		echo ""
		docker build -t $nom_imagen . 
		echo ""
		echo "Imágen Creada" 
		echo ""
	;;
	
		6)
		echo "Imágenes existentes"
		echo ""
		docker images
		echo ""
	read -rep $'Pon los primeros 3 caracteres del ID de la imágen: ' ID4
		echo ""
		docker image rm $ID4 
		echo ""
		echo "Imágen Borrada" 
		echo ""
	;;
	7)
	contador=1
	echo "Saliendo..."
	sleep 2
	echo "Guardando contenido..."
	sleep 4
	echo "Adios!"
	;;
	*)
	echo "¡ERROR! DEBES SELECCIONAR ALGO O SALIR DEL MENÚ CON LA OPCIÓN 7"
	;;
esac
done	
