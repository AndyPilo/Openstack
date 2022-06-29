#! /bin/bash

#########################################     FUNCION actualizarSistema    ################################################
function actualizarSistema(){

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
    echo "¿Desea continuar?"
    echo "S-Si        N-No"
    read -r pregunta4 
    valorRetorno2=1
    repetir4=1
    while [ $repetir4 == 1 ] 
    do

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
    echo "¿Desea continuar?"
    echo "S-Si         N-No"  
    read -r pregunta5 
    repetir5=1
    while [ $repetir5 == 1 ] 
    do

        if [ "$pregunta5" == "S" ] 
        then
            echo "Generando clave de conexion..."
            repetir5=0
        elif [ "$pregunta5" == "N" ]
        then
            echo "No ha inicializado Microstack por lo tanto no podra utilizar Openstack"
            repetir5=0
            valorRetorno2=0
        else
            echo "Opciòn no vàlida"
        fi
    done
}

#################################################     P R I N C I P A L    ################################################
echo "1-)Actualizaciòn de los paquetes del sistema operativo"
#FUNCION actualizarSistema
actualizarSistema

#Instalacion de Git
echo "2-)Instalaciòn de GIT"
instalarGit 
echo ""

#Instalacion de Snap
echo "3-)Instalaciòn de Snap"
instalarSnap 
echo ""

#Instalacion de microstack
echo "4-)Instalacion de Microstack"
instalarMicrostack 
echo ""

if [ "$valorRetorno" == 1 ] 
then
    #Inicializar MicroStack
    echo"5-)Inicializacion del nodo control de Openstack"
    microstackInit
    echo ""
    if [ "$valorRetorno2" == 1 ] 
    then
        echo "6-)Añadir nueva computadora como nodo a la nube"
    fi
fi