#! /bin/bash

#########################################     FUNCION actualizarSistema    ################################################
function actualizarSistema(){

    echo "A continuacion se procedera a actualizar los paquetes del sistema operativo"
    echo ""
    
    local repetir0=1

    while [ $repetir0 -eq 1 ]
    do
        echo "¿Desea Continuar?"
        echo "S-Si         N-No"
        read -r pregunta1

        if [ "$pregunta1" == "S" ] 
        then
	        echo "Instalando Git en su sistema operativo ..."
            output=$(sudo apt-get update)
            echo "$output"
            repetir0=0
        elif [ "$pregunta1" == "N" ]
        then
            repetir0=0
        else 
            echo "Opciòn no vàlida"
            echo ""
            echo ""
        fi  
    done        
}


#########################################     FUNCION InstalarGit    ################################################

function instalarGit(){

    echo "Es necesario tener instalado Git en el sistema operativo"
    
    local repetir1=1

    while [ $repetir1 -eq 1 ]
    do
        echo "¿Desea instalar Git?"
        echo "S-Si(Recomendado)         N-No"
        read -r pregunta1

        if [ "$pregunta1" == "S" ] 
        then
	        echo "Instalando Git en su sistema operativo ..."
            sudo apt-get install git
            repetir1=0
        elif [ "$pregunta1" == "N" ]
        then
            echo "Instalaciòn de Git omitida"
            repetir1=0
        else 
            echo "Opciòn no vàlida"
            echo ""
            echo ""
        fi  
    done        
}

############################################   FUNCION instalarSnap    ################################################
function instalarSnap(){

    echo "Es necesario tener instalado snap en el sistema operativo"
    
    local repetir2=1

    while [ $repetir2 -eq 1 ]
    do
        echo "¿Desea instalar Snap?"
        echo "S-Si(Recomendado)         N-No"
        read -r pregunta2

        if [ "$pregunta2" == "S" ] 
        then
	        echo "Instalando Snap en su sistema operativo ..."
            sudo apt install snapd
            repetir2=0
        elif [ "$pregunta2" == "N" ]
        then
            echo "Instalaciòn de Snap omitida"
            repetir2=0
        else 
            echo "Opciòn no vàlida"
            echo ""
            echo ""
        fi  
    done        
}


############################################   FUNCION instalarMicrostack    ################################################
function instalarMicrostack(){

    echo "Se procedera a instalar Microstack"
    
    local repetir3=1
    valorRetorno=1

    while [ $repetir3 -eq 1 ]
    do
        echo "¿Desea continuar?"
        echo "S-Si         N-No"
        read -r pregunta3

        if [ "$pregunta3" == "S" ] 
        then
	        echo "Instalando Microstack en su sistema operativo ..."
            sudo snap install microstack --beta
            repetir3=0
        elif [ "$pregunta3" == "N" ]
        then
            echo "Instalaciòn de OpenStack cancelada"
            repetir3=0
            valorRetorno=0
        else 
            echo "Opciòn no vàlida"
            echo ""
            echo ""
        fi  
    done        
}

############################################   FUNCION microstackInit    ################################################
function microstackInit(){

    echo "A continuacion se procedera a inicializar Microstack en su nodo controlador"
     
    valorRetorno2=1
    repetir4=1
    while [ $repetir4 == 1 ] 
    do
        echo "¿Desea continuar?"
        echo "S-Si        N-No"
        read -r pregunta4

        if [ "$pregunta4" == "S" ] 
        then
            echo "Inicializando Microstack ..."
            sudo microstack init --auto --control
            repetir4=0
        elif [ "$pregunta4" == "N" ]
        then
            echo "No ha inicializado Microstack por lo tanto no podra utilizar Openstack"
            repetir4=0
            valorRetorno2=0
        else
            echo "Opciòn no vàlida"
        fi
    done


}

############################################   FUNCION agregarNodo    ################################################
function agregarNodo(){

    echo "A continuacion se procedera a agregar un nodo computo a Openstack"
    
    repetir5=1
    while [ $repetir5 == 1 ] 
    do
        echo "¿Desea continuar?"
        echo "S-Si         N-No"  
        read -r pregunta5

        if [ "$pregunta5" == "S" ] 
        then
            echo "Generando clave de conexion..."
            sudo microstack add-compute
            repetir5=0
        elif [ "$pregunta5" == "N" ]
        then
            echo "Proceso de agregar computo cancelado"
            repetir5=0
            valorRetorno2=0
        else
            echo "Opciòn no vàlida"
        fi
    done
}

#################################################     P R I N C I P A L    ################################################
echo "INSTALACIÓN DE OPENSTACK AUTOMATIZADA:"
echo ""

echo "Paso#1 - Actualizaciòn de los paquetes del sistema operativo"
echo ""
#FUNCION actualizarSistema
actualizarSistema
#clear

#Instalacion de Git
echo "Paso#2 - Instalaciòn de GIT"
instalarGit 
clear

#Instalacion de Snap
echo "Paso#3 - Instalaciòn de Snap"
instalarSnap 
clear

#Instalacion de microstack
echo "Paso#4 - Instalacion de Microstack"
instalarMicrostack 
clear

if [ "$valorRetorno" == 1 ] 
then
    #Inicializar MicroStack
    echo "Paso#5 - Inicializacion del nodo control de Openstack"
    microstackInit
    clear
    if [ "$valorRetorno2" == 1 ] 
    then
        echo "Paso#6 - Añadir nueva computadora como nodo a la nube"
        agregarNodo
    fi
fi
clear
echo "Instalación exitosa"
    
