Algoritmo SistemaDeVentaDePasajesAereos
	
	// 1-Definimos las variables con sus respectivos Tipos de datos.
	
	Definir dniTotales, pasajerosTotales, telefonosTotales, viajeroFrecuente, rutasVuelos  Como Cadena
	Definir boletosVendidos, asientosTotales, menuOpciones, cantidadMaximaPasajeros, cantPasajerosRuta  Como Entero
	Definir salir, exitMenu Como Caracter
	Definir equipajePasajero Como Logico
	
	// Definir para funcion costos
	Definir cantPasajerosRuta1, cantPasajerosRuta2, cantPasajerosRuta3, cantPasajerosRuta4 Como Entero
	
	// Definir costo pasaje
	Definir costoPasaje Como Real
	
	// Incializacion
	cantPasajerosRuta1 <- 0
	cantPasajerosRuta2 <- 0
	cantPasajerosRuta3 <- 0
	cantPasajerosRuta4 <- 0
	
	// 2-Definimos dimension --> En este caso utilizamos Arrays tanto Unidimensional como Bidimensional.
	
    //Unidimensional
	Dimension rutasVuelos[4]
	Dimension cantidadMaximaPasajeros[4]
	Dimension boletosVendidos[4]
	
    //Bidimensional
	Dimension dniTotales[4,120]
	Dimension asientosTotales[4,120]
	Dimension pasajerosTotales[4,120]
	Dimension telefonosTotales[4,120]
	Dimension viajeroFrecuente[4,120]
	Dimension equipajePasajero[4,120]
	
	// 3-Inicializamos Arrays con sus respectivos valores.
	
	//Inicializamos la cantidad maxima de pasajeros --> Con el valor determinado en la consigna-
	cantidadMaximaPasajeros[0] <- 120
	cantidadMaximaPasajeros[1] <- 120 
	cantidadMaximaPasajeros[2] <- 80
	cantidadMaximaPasajeros[3] <- 80
	
	//Incializamos el array rutasVuelos asignadoles Los valores prederterminados.
	rutasVuelos[0] <- "Buenos Aires - Bariloche"
	rutasVuelos[1] <- "Buenos Aires - Salta"
	rutasVuelos[2] <- "Rosario - Buenos Aires"
	rutasVuelos[3] <- "Mar Del Plata - Mendoza"
	
	
	// Inicializamos los billetes/boletos vendidos en 0, para luego asignar el valor que contengan mas adelante en los procesos.
	boletosVendidos[0]<- 0
	boletosVendidos[1]<- 0
	boletosVendidos[2]<- 0
	boletosVendidos[3]<- 0
	
	// Mensaje de bienvenida
	Escribir "---------BIENVENIDOS AL SISTEMA DE VENTAS PARA PASAJES AEREOS---------"
	
	// Creacion menu con uso de repetir, y sus validaciones.
	Repetir
		Escribir "MENU:"
		Escribir "1. Venta pasaje" 
		Escribir "2. Buscar pasaje vendido"
		Escribir "3. Buscar pasajero"
		Escribir "4. Ordenar y mostrar lista de pasajeros"
		Escribir "5. Listado/s"
		Escribir "6. SALIR"
		Leer menuOpciones
		
		
		
		// Creacion de las opciones del menu con el uso de un Segun + Validacion de Salir
		Segun menuOpciones Hacer
			1:                                                                                                                            
				ventaBoletoAreo(rutasVuelos, boletosVendidos, cantidadMaximaPasajeros, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, cantPasajerosRuta)
				
			2:
				busquedaBoletoVendido(boletosVendidos, asientosTotales, pasajerosTotales, dniTotales, rutasVuelos)
			3:
				
				busquedaPasajero(boletosVendidos, pasajerosTotales, dniTotales, rutasVuelos)
				
			4:	
				
				ordenamientoListaPasajeros(rutasVuelos,boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero)
				
			5:	
				listaCantBoletosVendidosPorPorcentaje(rutasVuelos, boletosVendidos, cantidadMaximaPasajeros)
				
			6:
				Escribir "Ingrese SALIR para finalizar el proceso."
				Leer exitMenu
				exitMenu <- Mayusculas(exitMenu)
				Escribir "Gracias por utilizar nuestro sistema de ventas."
			De Otro Modo:
				Escribir "Error, intente nuevamente por favor."
		FinSegun
	Hasta Que exitMenu = "SALIR"
	
FinProceso



// Creamos funcion de la venta de los pasajes y agregamos sus respectivos parametros
Funcion ventaBoletoAreo(rutasVuelos,boletosVendidos,cantidadMaximaPasajeros,dniTotales,pasajerosTotales,telefonosTotales,asientosTotales,viajeroFrecuente,equipajePasajero,cantPasajerosRuta)
	
	// Definimos y creamos las nuevas variables
	Definir nombreApellido, dniPasajero, telefonoPasajero, numPasajeroFrecuente, equipaje Como Cadena
	Definir asientoPasajero, rutaElegida, siNoEquipaje, pasFrec, i Como Entero
	Definir equipajeBodega Como logico
	Definir costoPasaje Como Real
	
	Repetir
        Escribir "Seleccione el destino al que desea volar:"
        Escribir "1 - Buenos Aires - Bariloche"
        Escribir "2 - Buenos Aires - Salta"
        Escribir "3 - Rosario - Buenos Aires"
        Escribir "4 - Mar Del Plata - Mendoza"
        Leer rutaElegida 
		Si rutaElegida < 1 o rutaElegida > 4 Entonces
			Escribir "Error: Ruta no encontrada, intente nuevamente."
		Fin Si
	Mientras Que rutaElegida < 1 o rutaElegida > 4
	
	rutaElegida <- rutaElegida - 1 //--> Equivale a -1 ya que el array es [0 1 2 3 ]  es de 4 elemntos, si pongo uno en el destino seleccionado llamaria a 0 y si pongo 4 a 3.
	
	
	//Verificamos que la ruta seleccionada sea válida y que haya disponibilidad de pasajes.
	Si boletosVendidos[rutaElegida] = cantidadMaximaPasajeros[rutaElegida] Entonces
		Escribir "No se encontraron plazas disponibles"
	SiNo
		Escribir "Ingrese Nombre completo y apellido"
		Leer nombreApellido
	Finsi
	
	
	// Creacion de un repetir para, el ingreso y validacion del DNI del pasajero.
	// Dni creado como cadena para poder usarlo en el repetir y validar su longitud.
	Repetir
		Escribir "Complete ingresando DNI del pasajero"
		Leer dniPasajero
		
		Si  Longitud(dniPasajero)<6 o Longitud(dniPasajero)>8 Entonces
			Escribir "DNI ingresado es invalido, intente nuevamente"
		FinSi
	Mientras Que Longitud(dniPasajero)<6 o Longitud(dniPasajero)>8
	
	
	
	// Repetir para el verificar la longitud del telefono del pasajero.
	Repetir
		Escribir "Ingrese el télefono del pasajero (DEBE CONTENER 8 NUMERO)"
		Leer telefonoPasajero
		Si Longitud(telefonoPasajero) > 8  o Longitud(telefonoPasajero)<8 Entonces
			Escribir "Telefono INVALIDO, intente nuevamente"
		FinSi
	Mientras Que Longitud(telefonoPasajero) > 8  o Longitud(telefonoPasajero)<8
	
	
	// Repetir para saber si el pasajero va a ingresar equipaje en bodega o no.
	// Hasta que --> Le pongamos 1 o 2.
	Repetir
		Escribir "Ingresa equipaje por bodega?" 
		Escribir "1-Si 2-No"
		Leer siNoEquipaje
		
		Si siNoEquipaje==1 Entonces
			equipajeBodega = Verdadero
		SiNo
			equipajeBodega = Falso
		FinSi
	Hasta Que siNoEquipaje  == 1 o siNoEquipaje == 2
	
	// Creacion de un segun para el contador. de costos
	// Contadores que van acumulando la cantidad de pasajeros que compran voleto en cada ruta.
	// Asiganmos a costoPasaje <- CalcularCostoPasaje <--  Y segun esos parametros calcular el pecrcio del boleto.
	Segun rutaElegida Hacer
		0: 
			costoPasaje =  CalcularCostoPasaje(rutaElegida, cantPasajerosRuta1, equipajeBodega, costoPasaje)
			
			cantPasajerosRuta1=cantPasajerosRuta1+1
		1:
			costoPasaje =  CalcularCostoPasaje(rutaElegida, cantPasajerosRuta2, equipajeBodega, costoPasaje)
			
			cantPasajerosRuta2=cantPasajerosRuta2+1
		2:
			costoPasaje =  CalcularCostoPasaje(rutaElegida, cantPasajerosRuta3, quipajeBodega, costoPasaje)
			
			cantPasajerosRuta3=cantPasajerosRuta3+1
		3:	
			costoPasaje =  CalcularCostoPasaje(rutaElegida, cantPasajerosRuta4, equipajeBodega, costoPasaje)
			
			cantPasajerosRuta4=cantPasajerosRuta4+1
			
	FinSegun
	
	// Creacion de un repetir para saber si el pasajero es viajero frecuente.
	// Se va a repetir hasta que la opcion del pasajero frecuente sea 1 o 2.
	Repetir
		Escribir "Usted es pasajero frecuente? "
		Escribir "1-Si 2-No"
		leer pasFrec
	Hasta Que pasFrec == 1 o pasFrec == 2	
	
	// Se va a repetir el condicional SI --> Hasta que la longitud de la variable sea igual a 4.
	Si pasFrec==1 Entonces
		Repetir
			Escribir "Ingresar codigo de pasajero frecuente (De cuatro digitos)"
			Leer numPasajeroFrecuente
			
			Si Longitud(numPasajeroFrecuente) > 4 o Longitud(numPasajeroFrecuente) < 4 Entonces
				Escribir "numero de pasajero incorrecto vuelva a intentarlo"
			FinSi
		Hasta Que Longitud(numPasajeroFrecuente) == 4  
	FinSi
	
	
	// Contamos los boletos vendidos --> Y procedemos a llevar un registro.
	asientoPasajero <- boletosVendidos[rutaElegida] 
	boletosVendidos[rutaElegida] <- boletosVendidos[rutaElegida] + 1
	
	// Proceso para almacenar los datos <-- Asignamos a cada array la variable que le corresponde para almacenar los datos.
	equipajePasajero[rutaElegida,asientoPasajero]<- equipajeBodega
	pasajerosTotales[rutaElegida,asientoPasajero] <- nombreApellido
	dniTotales[rutaElegida,asientoPasajero] <- dniPasajero
	telefonosTotales[rutaElegida,asientoPasajero] <- telefonoPasajero
	viajeroFrecuente[rutaElegida,asientoPasajero] <- numPasajeroFrecuente
	asientosTotales[rutaElegida, asientoPasajero] <- boletosVendidos[rutaElegida]
	
	
	
	//Resumen de la venta con sus respectivos datos y variables.
	Escribir "Resumen de la venta"
	Escribir "Ruta: ", rutasVuelos[rutaElegida]
	Escribir "Nombre y Apellido: ", nombreApellido
	Escribir "DNI: ", dniPasajero
	Escribir "Télefono: ", telefonoPasajero
	Escribir "Equipaje en Bodega: ", equipajeBodega 
	Escribir "Número de pasajero frecuente: ", numPasajeroFrecuente
	Escribir "Asiento: ", asientoPasajero + 1 // Pusimos + 1 para que contabilize el asiento y lo inicie en 1 despues de poner los datos, ya que sino nos daba error y aparecia en 0 por consola
	Escribir "Costo pasaje: $", costoPasaje
	
FinFuncion

// Creamos funcion para calcular el costo del pasaje
// Definimos las variables
Funcion costoPasaje =  CalcularCostoPasaje(rutaElegida, cantPasajerosRuta, equipajeBodega, costoPasaje)
	
	Definir precioPasajes Como Real
	
	Segun rutaElegida Hacer
		0:  
			Si cantPasajerosRuta <= 20 Entonces
				precioPasajes =  150000
			SiNo
				Si cantPasajerosRuta > 20 y cantPasajerosRuta < 60 Entonces
					precioPasajes = 150000 + (150000 * 0.10)
				SiNo
					precioPasajes = 180000
				FinSi
			FinSi
			
		1:
			Si cantPasajerosRuta <= 20   Entonces
				precioPasajes = 120000
			SiNo
				Si cantPasajerosRuta > 20 y cantPasajerosRuta < 60 Entonces
					precioPasajes = 120000 + (120000 * 0.10)
				SiNo
					precioPasajes = 150000
				FinSi
			FinSi
			
		2:
			Si cantPasajerosRuta <= 10 Entonces
				precioPasajes = 70000
			SiNo
				Si cantPasajerosRuta>10 y cantPasajerosRuta < 40 Entonces
					precioPasajes = 70000 + (70000 * 0.15)
				SiNo
					precioPasajes = 95000
				FinSi
			FinSi
			
		3:  
			Si cantPasajerosRuta <= 10 Entonces
				precioPasajes = 95000
			SiNo
				Si cantPasajerosRuta > 10 y cantPasajerosRuta < 40 Entonces
					precioPasajes = 95000 + (95000 * 0.15)
				SiNo
					precioPasajes = 125000
				FinSi
			FinSi
	FinSegun
	
	
	Si equipajeBodega = Verdadero Entonces
		precioPasajes = precioPasajes + (precioPasajes * 0.05)
	FinSi
	
	costoPasaje = precioPasajes
	
FinFuncion



//Creacion de sub Proceso para la Busqueda del pasaje vendido.
SubProceso busquedaBoletoVendido(boletosVendidos,asientosTotales, pasajerosTotales, dniTotales, rutasVuelos)
	Definir rutaBuscada como entero
	Definir numAsientoBuscado Como Entero
	Definir i como entero
	
    Escribir "1 - Buenos Aires - Bariloche"
    Escribir "2 - Buenos Aires - Salta"
    Escribir "3 - Rosario - Buenos Aires"
    Escribir "4 - Mar Del Plata - Mendoza"
    Leer rutaBuscada
	
	rutaBuscada<-rutaBuscada-1
	
	Escribir "Digitar numero de asiento a buscar"
    Leer numAsientoBuscado
	
	Definir encontrado como entero
	encontrado = 0
	
    Para i<-0 Hasta boletosVendidos[rutaBuscada] Con Paso 1 Hacer
		
        Si  asientosTotales[rutaBuscada,i] = numAsientoBuscado  Entonces
			Escribir "Nombre y Apellido del Pasajero: ", pasajerosTotales[rutaBuscada,i]
            Escribir  "Ruta Vuelo: ", rutasVuelos[rutaBuscada]
            Escribir "DNI Pasajero: ", dniTotales[rutaBuscada,i]
			encontrado = 1	
			
		FinSi
    FinPara
	
	Si encontrado == 0 Entonces
        Escribir "El numero de asiento que usted busca no fue encontrado, intente nuevamente"
    FinSi
	
FinSubProceso


// Sub proceso para buscar pasajero con sus respectivos atributos.
SubProceso busquedaPasajero(boletosVendidos, pasajerosTotales, dniTotales, rutasVuelos)
	
	Definir rutaBuscada como Entero
	Definir nombreBuscado como Texto
	Definir encontrado Como Entero
	encontrado = 0
	
	Definir i Como Entero
	
	Escribir "Ingrese la ruta para buscar el pasajero"
    Escribir "1 - Buenos Aires - Bariloche"
    Escribir "2 - Buenos Aires - Salta"
    Escribir "3 - Rosario - Buenos Aires"
    Escribir "4 - Mar Del Plata - Mendoza"
	
    Leer rutaBuscada
	
	rutaBuscada<-rutaBuscada-1
	
	Escribir "Ingrese el nombre que desea buscar"
	Leer nombreBuscado
	
	
	Para i = 0 Hasta boletosVendidos[rutaBuscada] Hacer
		
		Si pasajerosTotales[rutaBuscada,i] = nombreBuscado Entonces
			
			Escribir "Nombre y Apellido del Pasajero: ", pasajerosTotales[rutaBuscada, i]
			Escribir "Destino del pasajero: ", rutasVuelos[rutaBuscada]
			Escribir "DNI del pasajero: ", dniTotales[rutaBuscada, i]
			encontrado = 1
		FinSi
	FinPara
	
	Si encontrado == 0 Entonces
		Escribir "Pasajero no encontrado, intente nuevamente"
	FinSi
FinSubProceso


// Creamos un SubProceso para que se pueda --> Ordenar la lista 
// Agregamos los parametros correspondientes.
SubProceso ordenamientoListaPasajeros(rutasVuelos, boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero)
	
	Definir opcionSwitch Como Caracter
	Definir i, j, rutaBuscada Como Entero
	
	Repetir
		Escribir "Seleccione una opción"
		Escribir "a- Ordenar lista Ascendente"
		Escribir "b- Ordenar lista Descendente"
		Leer opcionSwitch
	   	Si opcionSwitch <> "a" y opcionSwitch <> "A" y opcionSwitch <> "b" y opcionSwitch <> "B" Entonces
			Escribir "opcion incorrecta, vuelva a intentarlo..."
		FinSi
	Mientras Que  opcionSwitch <> "a" y opcionSwitch <> "A" y opcionSwitch <> "b" y opcionSwitch <> "B"
	
	
	Escribir "Ingrese la ruta: "
    Escribir "1 - Buenos Aires - Bariloche"
    Escribir "2 - Buenos Aires - Salta"
    Escribir "3 - Rosario - Buenos Aires"
    Escribir "4 - Mar Del Plata - Mendoza"
    Leer rutaBuscada 
	
	rutaBuscada <- rutaBuscada - 1
	
	// Segun con las opciones para ordenar de forma Ascendente y Descendente -- A su vez Mostrar las listas.
	// Se puede utilizar tanto las minusculas como las mayusculas. 
	
	Segun opcionSwitch Hacer
		"a":
			ordenarAscendente(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
			mostrarLista(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
			
		"A"	:
			ordenarAscendente(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
			mostrarLista(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
			
		"b"	:	
			ordenarDescendente(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
			mostrarLista(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)	
			
		"B":
			ordenarDescendente(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
			mostrarLista(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
			
		De Otro Modo:
			Escribir "Opcion invalida, intente nuevamente"
	FinSegun
FinSubProceso




//Sub proceso para ordenar de Forma Ascendente
// Definimos las variables y a su vez usamos un para -- > De esta forma ponemos los auxiliares y definimos temp
SubProceso ordenarAscendente(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
	
	Definir aux Como Cadena
    Definir temp Como Entero
    Definir aux2 Como Logico
    Definir i, j Como Entero
	
	
    Para i<- 0 Hasta boletosVendidos[rutaBuscada] - 2 Con Paso 1 Hacer
		
        Para j<-i+1 Hasta boletosVendidos[rutaBuscada] - 1 Con Paso 1 Hacer
			
            Si asientosTotales[rutaBuscada, i] > asientosTotales[rutaBuscada, j] Entonces 
				
                temp <- viajeroFrecuente[rutaBuscada, j]
                viajeroFrecuente[rutaBuscada, j] <- viajeroFrecuente[rutaBuscada, i]
                viajeroFrecuente[rutaBuscada, i] <- temp
				
                temp <- asientosTotales[rutaBuscada, j]
                asientosTotales[rutaBuscada, j] <- asientosTotales[rutaBuscada, i]
                asientosTotales[rutaBuscada, i] <- temp
				
                aux2 <- equipajePasajero[rutaBuscada, j]
                equipajePasajero[rutaBuscada, j] <- equipajePasajero[rutaBuscada, i]
                equipajePasajero[rutaBuscada, i] <- aux2
				
                aux <- dniTotales[rutaBuscada, j]
                dniTotales[rutaBuscada, j] <- dniTotales[rutaBuscada, i]
                dniTotales[rutaBuscada, i] <- aux
				
                aux <- pasajerosTotales[rutaBuscada, j]
                pasajerosTotales[rutaBuscada, j] <- pasajerosTotales[rutaBuscada, i]
                pasajerosTotales[rutaBuscada, i] <- aux
				
                aux <- telefonosTotales[rutaBuscada, j]
                telefonosTotales[rutaBuscada, j] <- telefonosTotales[rutaBuscada, i]
                telefonosTotales[rutaBuscada, i] <- aux
				
			FinSi
			
		FinPara
	FinPara
	
	
FinSubProceso


// Sub proceso para Ordenar Descendentemente los datos del pasajero.
// Uilizamos el aux como cadena para que coincida con el tipo de dato --> en el para --> ya que tipo aux es cadena y temp entero

SubProceso ordenarDescendente(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
	
	Definir aux Como Cadena
    Definir temp Como Entero
    Definir aux2 Como Logico
    Definir i, j Como Entero
	
	
    Para i<- 0 Hasta boletosVendidos[rutaBuscada] - 2 Con Paso 1 Hacer
		
        Para j<-i+1 Hasta boletosVendidos[rutaBuscada] - 1 Con Paso 1 Hacer
			
            Si asientosTotales[rutaBuscada, i] < asientosTotales[rutaBuscada, j] Entonces 
				
                aux <- viajeroFrecuente[rutaBuscada, j]
                viajeroFrecuente[rutaBuscada, j] <- viajeroFrecuente[rutaBuscada, i]
                viajeroFrecuente[rutaBuscada, i] <- aux
				
                temp <- asientosTotales[rutaBuscada, j]
                asientosTotales[rutaBuscada, j] <- asientosTotales[rutaBuscada, i]
                asientosTotales[rutaBuscada, i] <- temp
				
                aux2 <- equipajePasajero[rutaBuscada, j]
                equipajePasajero[rutaBuscada, j] <- equipajePasajero[rutaBuscada, i]
                equipajePasajero[rutaBuscada, i] <- aux2
				
                aux <- dniTotales[rutaBuscada, j]
                dniTotales[rutaBuscada, j] <- dniTotales[rutaBuscada, i]
                dniTotales[rutaBuscada, i] <- aux
				
                aux <- pasajerosTotales[rutaBuscada, j]
                pasajerosTotales[rutaBuscada, j] <- pasajerosTotales[rutaBuscada, i]
                pasajerosTotales[rutaBuscada, i] <- aux
				
                aux <- telefonosTotales[rutaBuscada, j]
                telefonosTotales[rutaBuscada, j] <- telefonosTotales[rutaBuscada, i]
                telefonosTotales[rutaBuscada, i] <- aux
			FinSi
		FinPara
	FinPara
	
FinSubProceso



// Creacion de Sub proceso para Mostar la lista de forma ordenada. 
// El escribir lo hicimos asi para que los muestre a los datos del pasajero una vez ordenados de forma seguida al lado del otro.
// Ya que sino lo que sucedia es que uno abajo del otro, no nos dabamos cuenta cual era el dato de cada pasajero.

SubProceso mostrarLista(boletosVendidos, dniTotales, pasajerosTotales, telefonosTotales, asientosTotales, viajeroFrecuente, equipajePasajero, rutaBuscada)
	
	Definir i Como Entero
	
	Para i<-0 Hasta boletosVendidos[rutaBuscada] - 1 Con Paso 1 Hacer
		Escribir pasajerosTotales[rutaBuscada,i], " ", dniTotales[rutaBuscada,i], " ", telefonosTotales[rutaBuscada,i], " ", asientosTotales[rutaBuscada,i], " ",  viajeroFrecuente[rutaBuscada,i], " ", equipajePasajero[rutaBuscada,i], " "
	FinPara
	
FinSubProceso


// Procedemos a crear otro Sub Proceso --> Vamos a especificar que opcion quiere la persona : 
// Si un listado para determinar Cantidad de pasajes vendidos por ruta area o 
// Un listado para el Porcentaje de ventas por ruta area

SubProceso listaCantBoletosVendidosPorPorcentaje(rutasVuelos,boletosVendidos,cantidadMaximaPasajeros)
	
	Definir opcionSwitch como caracter
	
	Repetir
		Escribir "Seleccione una opción"
		Escribir "a- Cantidad de pasajes vendidos por ruta aérea"
		Escribir "b- Porcentaje de ventas por ruta aérea"
		Leer opcionSwitch
	   	Si opcionSwitch <> "a" y opcionSwitch <> "A" y opcionSwitch <> "b" y opcionSwitch <> "B" Entonces
			Escribir "La opcion es incorrecta, vuelva a intentarlo..."
		FinSi
		
	Mientras Que opcionSwitch <> "a" y opcionSwitch <> "A" y opcionSwitch <> "b" y opcionSwitch <> "B"
	
	Segun opcionSwitch Hacer
		
		"a" :
			
			cantidadPasajesVendidosPorRuta(rutasVuelos,boletosVendidos)
			
			
		"A": 
			cantidadPasajesVendidosPorRuta(rutasVuelos,boletosVendidos)
			
		"b" :
			
			porcentajeVentasPorRuta(rutasVuelos,cantidadMaximaPasajeros, boletosVendidos)
			
		"B":	
			porcentajeVentasPorRuta(rutasVuelos,cantidadMaximaPasajeros, boletosVendidos)
			
		De Otro Modo:
			Escribir "Opcion incorrecta"
	FinSegun
FinSubProceso


// Creacion de Sub Proceso final 
// Opcion a -->  Del Menu opcion 5 -- > Calcular la cantidad de pasajes vendidos por cada ruta.

SubProceso cantidadPasajesVendidosPorRuta(rutasVuelos,boletosVendidos)
	
	Definir i Como Entero
	
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		Escribir rutasVuelos[i], " ", boletosVendidos[i]
	FinPara
	
FinSubProceso



// Creacion de Sub Proceso final 
// Opcion b -->  Del Menu opcion 5 -- > Porcentaje de ventas por ruta aére.

SubProceso porcentajeVentasPorRuta(rutasVuelos,cantidadMaximaPasajeros, boletosVendidos)
	
	Definir i como entero
	
	Para i<-0 Hasta 3 Con Paso 1 Hacer
		Escribir "Porcentaje vendido en vuelo: ", rutasVuelos[i]," ", (boletosVendidos[i]/cantidadMaximaPasajeros[i]*100),"%"
	FinPara
	
FinSubProceso