#! /bin/bash

#########################################     FUNCION actualizarSistema    ################################################
function actualizarSistema(){

    echo "A continuacion se procedera a actualizar los paquetes del sistema operativo"
    
    local repetir0=1

    while [ $repetir0 -eq 1 ]
    do
        echo "¿Desea Continuar con la instalacion?"
        echo "S-Actualizar         N-Omitir"
        echo ""
        read -r pregunta1

        if [ "$pregunta1" == "S" ] 
        then
            echo ""
	        echo "Actualizando sistema operativo ..."
            output1=$(sudo apt-get update)
            repetir0=0
            printf '%s\n' "$output1"
            if [[ "$output1" == *"Fallo"* || "$output1" == *"Error"* ]]
            then
                echo ""
                echo "Ha ocurrido un error, Intentelo de nuevo"
                repetir0=1
            fi
            echo "Sitema operativo Actualizado"
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
            echo ""
	        echo "Instalando Git en su sistema operativo ..."
            output2=$(sudo apt-get install git)
            repetir1=0
            printf '%s\n' "$output2"
            if [[ "$output2" == "Fallo" || "$output2" == "Error" ]]
            then
                echo ""
                echo "Ha ocurrido un error, Intentelo de nuevo"
                repetir1=1
            else
                echo ""
                echo "Git instalado"
            fi
        elif [ "$pregunta1" == "N" ]
        then
            echo ""
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
            echo ""
	        echo "Instalando Snap en su sistema operativo ..."
            output3=$(sudo apt-get install snapd)
            repetir2=0
            printf '%s\n' "$output3"
            if [[ "$output3" == *"Fallo"* || "$output3" == *"Error"* ]]
            then
                echo ""
                echo "Ha ocurrido un error, Intentelo de nuevo"
                repetir2=1
            else
                echo ""
                echo "Snap Instalado"
            fi
        elif [ "$pregunta2" == "N" ]
        then
            echo ""
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
        echo "¿Desea Instalar?"
        echo "S-Si         N-No"
        read -r pregunta3
        valorFinal=0

        if [ "$pregunta3" == "S" ] 
        then
            echo ""
	        echo "Instalando Microstack en su sistema operativo ..."
            output4=$(sudo snap install microstack --beta)
            repetir3=0
            printf '%s\n' "$output4"
            if [[ "$output4" == "Fallo" || "$output4" == "Error" ]]
            then
                echo ""
                echo "Ha ocurrido un error, Intentelo de nuevo"
                repetir3=1
            else   
                echo ""
                echo "Microstack instalado"
            fi
            valorFinal=1
        elif [ "$pregunta3" == "N" ]
        then
            echo ""
            echo "Instalaciòn de OpenStack cancelada"
            repetir3=0
            valorRetorno=0
            valorFinal=0
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
        echo "¿Desea Instalar?"
        echo "S-Si        N-No"
        read -r pregunta4

        if [ "$pregunta4" == "S" ] 
        then
            echo ""
            echo "Inicializando Microstack ..."
            output5=$(sudo microstack init --auto --control)
            repetir4=0
            printf '%s\n' "$output5"
            if [[ "$output5" == "Fallo" || "$output5" == "Error" ]]
            then
                echo ""
                echo "Ha ocurrido un error, Intentelo de nuevo"
                repetir4=1
            else
                echo ""
                echo "Microstack instalado en su nodo controlador"
            fi
            valorFinal=2
        elif [ "$pregunta4" == "N" ]
        then
            echo ""
            echo "No ha inicializado Microstack por lo tanto no podra utilizar Openstack"
            repetir4=0
            valorRetorno2=0
            valorFinal=1
        else
            echo "Opciòn no vàlida"
            echo ""
            echo ""
        fi
    done


}

############################################   FUNCION agregarNodo    ################################################
function agregarNodo(){

    echo "A continuacion se procedera a agregar un nodo computo a Openstack"
    
    repetir5=1
    while [ $repetir5 == 1 ] 
    do
        echo "¿Desea agregar?"
        echo "S-Si         N-No"  
        read -r pregunta5

        if [ "$pregunta5" == "S" ] 
        then
            echo ""
            echo "Generando clave de conexion..."
            output6=$(sudo microstack add-compute)
            repetir5=0
            printf '%s\n' "$output6"
             if [[ "$output6" == "Fallo" || "$output6" == "Error" ]]
            then
                echo ""
                echo "Ha ocurrido un error, Intentelo de nuevo"
                repetir5=1
            fi
        elif [ "$pregunta5" == "N" ]
        then
            echo ""
            echo "Proceso de agregar computo cancelado"
            repetir5=0
        else
            echo "Opciòn no vàlida"
            echo ""
            echo ""
        fi
    done
}

#################################################     P R I N C I P A L    ################################################
echo "                          *******************************************"
echo "*                         *  INSTALACIÓN DE OPENSTACK AUTOMATIZADA  *"
echo "                          *******************************************"
echo ""

echo "Paso#1 - Actualizaciòn de los paquetes del sistema operativo"
#FUNCION actualizarSistema
actualizarSistema
echo ""
#clear

#Instalacion de Git
echo "Paso#2 - Instalaciòn de GIT"
instalarGit
echo "" 
#clear

#Instalacion de Snap
echo "Paso#3 - Instalaciòn de Snap"
instalarSnap
echo "" 
#clear

#Instalacion de microstack
echo "Paso#4 - Instalacion de Microstack"
instalarMicrostack
echo "" 
#clear

if [ "$valorRetorno" == 1 ] 
then
    #Inicializar MicroStack
    echo "Paso#5 - Inicializacion del nodo control de Openstack"
    microstackInit
    echo ""
    #clear
    if [ "$valorRetorno2" == 1 ] 
    then
        echo "Paso#6 - Añadir nueva computadora como nodo a la nube"
        agregarNodo
        echo ""
        #clear
    fi
fi
if [ "$valorFinal" == 2 ]
then
    echo "Instalación exitosa"
    echo "FIN DE LA INSTALACION"
elif [ "$valorFinal" == 1 ]
then
    echo "Microstack instalado, falta inicializarlo"
    echo "FIN DE LA INSTALACION"
else
    echo "FIN DE LA INSTALACION"
fi

    
