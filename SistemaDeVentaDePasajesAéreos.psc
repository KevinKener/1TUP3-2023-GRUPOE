Proceso SistemaDeVentaDePasajesAereos
	//Definicion de variables y parametros.
	definir pasajeros como entero
	Dimension pasajeros[10]
	
	definir nombre Como Caracter
	Dimension nombre[10]
	
	definir dni como texto
	Dimension dni[10]
	
	definir telefono como texto
	Dimension telefono[10] 
	
	definir bodega Como Entero
	Dimension bodega[10]
	
	definir numPasFrec como texto
	Dimension numPasFrec[10]
	
	
	definir rutasAereas como entero //array de rutas aereas disponibles
	Dimension rutasAereas[4]	
	
	definir costoPasajes como entero
	Dimension costoPasajes[10]
	
	
	definir opcionMenu Como Entero
	
	Definir salirMenu Como Caracter
	
	Definir arrayAsientos Como Entero
	Dimension arrayAsientos[1]
	
	
	
	//Creacion de menu con mensaje de Bienvenida.
	
	Escribir "---------BIENVENIDOS AL SISTEMA DE PASAJES AEREOS---------"
	
	Repetir
		Escribir "MENU:"
		Escribir "1. Venta pasaje" 
		Escribir "2. Buscar pasaje vendido"
		Escribir "3. Buscar pasajero"
		Escribir "4. Ordenar y mostrar lista de pasajeros"
		Escribir "a. Por número de asiento Ascendente"
		Escribir "b. Por número de asiento Descendente"
		Escribir "5. Listado/s"
		Escribir "a. Cantidad de pasajes vendido por ruta aerea"
		Escribir "b. Porcentaje de ventas por ruta aérea"
		Escribir "6. SALIR"
		leer opcionMenu
		
		
		//Creacion Menu y sus opciones con la validacion de la opcion Salir.
		Segun opcionMenu Hacer
			1:
				venderPasaje(rutasAereas,pasajeros,nombre,dni,telefono,numPasFrec,bodega,costoPasajes)
				//Funcion aun no agregada
			2:
				buscarPasajeroNumAsiento(arrayAsientos,nombre,rutasAereas,dni)
			3:
				Escribir "Buscar pasajero"
			6:
				Escribir "Ingrese SALIR para finalizar el proceso"
				leer salirMenu
				salirMenu <- Mayusculas(salirMenu)
				Escribir "Gracias por utilizar nuestro sistema de ventas"
			De Otro Modo:
				Escribir "error"
		FinSegun
	Hasta Que salirMenu = "SALIR"
	//Validacion de SALIR
	
	
	
FinProceso

Funcion venderPasaje(rutasAereas,pasajeros,nombre,dni,telefono,numPasFrec, bodega,costoPasajes)
	
	definir opcionRuta Como Entero
	definir pasajero como texto
	
	definir i como entero
	
	definir pasFrec como entero
    pasFrec=0
	
	definir cantPasajes como entero
	cantPasajes = 0
	
	definir numAsiento Como Entero
	
	Definir arrayAsientos Como Entero
	Dimension arrayAsientos[9]
	
	numAsiento = 0 // Incrementar el número de asiento
	
	Para i <- 0 hasta 1 Hacer
		
		
		Escribir "Ingrese la ruta area: 1. Buenos Aires - Bariloche 2. Buenos Aires - Salta 3. Rosario - Buenos Aires 4. Mar Del Plata - Mendoza"  
		leer rutasAereas[i]
		
		//Datos de cada pasajero
		
		Escribir "Ingresar nombre"
		leer nombre[i]
		
		
		Escribir "ingresar dni"
		leer dni[i]
		
		
		Escribir "ingresar telefono"
		leer telefono[i]
		
		Escribir "desea ingresar equipaje en bodega? 1-SI 2-NO"
		leer bodega[i]
		
		Escribir "es un pasajero frecuente? 1-si 2-no"
		leer pasFrec
		
		Si pasFrec==1 Entonces
			Escribir "ingresar numero"
			leer numPasFrec[i]
		FinSi
		
		//Opcion de Rutas aereas
		
		Segun rutasAereas[i] Hacer
			1:
				cantPasajes = cantPasajes+1
				Escribir "Ruta: Buenos Aires - Bariloche "
				
			2:
				
				escribir "Ruta: Buenos Aires - Salta" 
				
			3:
				Escribir "Ruta:  Rosario - Buenos Aires"
				
			4:  
				Escribir "Ruta: Mar Del Plata - Mendoza"
				
			De Otro Modo:
				Escribir "Ruta inexistente"
				
		FinSegun
		
		Escribir "Nombre: ",nombre[i]
		Escribir "DNI:",dni[i]
		Escribir "Telefono:",telefono[i]
		
		Segun bodega[i] Hacer
			1:
				Escribir "Equipaje en bodega: verdadero"
			2:
				Escribir   "Equipaje en bodega: falso"
				
			De Otro Modo:
				Escribir "Opcion incorrecta"
		FinSegun
		
		
		Si pasFrec==1 Entonces
			Escribir "Número pasajero frecuente: ",numPasFrec[i]
		FinSi
		
		
		
		numAsiento <- numAsiento + 1
		
		Escribir "Asiento: ",numAsiento
		
		arrayAsientos[i] <- NumAsiento
		
		
		//Opcion Segun de Cantidad de pasajes y costes
		
		Segun rutasAereas[i] Hacer
			1:                            
				
				Si cantPasajes<=20 Entonces
					
					costoPasajes[i] =  150000
					
					Escribir "Costo Pasaje: ",costoPasajes[i]  
					
					
				SiNo
					
					Si cantPasajes>20 y cantPasajes<=60 Entonces
						
						costoPasajes[i]= 150000 + (150000 * 0.10)
						Escribir "Costo Pasaje: ",costoPasajes[i]     
						
					SiNo
						costoPasajes[i] = 180000
						Escribir "Costo Pasaje: ",costoPasajes[i]     
					FinSi
					
				FinSi
				
			2:
				Si cantPasajes<=20   Entonces
					costoPasajes[i] = 120000
					Escribir "Costo Pasaje: ",costoPasajes[i]     
					
				SiNo
					
					Si cantPasajes>20 y cantPasajes<=60 Entonces
						
						costoPasajes[i] = 120000 + (120000 * 0.10)
						Escribir "Costo Pasaje: ",costoPasajes[i]   
					SiNo
						
						costoPasajes[i] = 150000
						Escribir "Costo Pasaje: ",costoPasajes[i]  
					FinSi
					
				FinSi
				
			3:
				Si cantPasajes<=10 Entonces
					
					costoPasajes[i] = 70000
					Escribir "Costo Pasaje: ",costoPasajes[i]  
					
				SiNo
					
					Si cantPasajes>10 y cantPasajes <=40 Entonces
						
						costoPasajes[i] = 70000 + (70000 * 0.15)
						Escribir "Costo Pasaje: ",costoPasajes[i]  
						
					SiNo
						
						costoPasajes[i] = 95000
						Escribir "Costo Pasaje: ",costoPasajes[i]  
					FinSi
					
					
				FinSi
				
			4:  
				Si cantPasajes <= 10 Entonces
					
					costoPasajes[i] = 95000
					Escribir "Costo Pasaje: ",costoPasajes[i]  
					
				SiNo
					
					Si cantPasajes > 10 y cantPasajes <= 40 Entonces
						
						costoPasajes[i] = 95000 + (95000 * 0.15)
						Escribir "Costo Pasaje: ",costoPasajes[i]  
						
					SiNo
						
						costoPasajes[i] = 125000
						Escribir "Costo Pasaje: ",costoPasajes[i]  
						
					FinSi
					
					
				FinSi
				
				
		FinSegun
		
		
		
	FinPara
	
	
	
FinFuncion

//Funcion de buscar pasajero por numero de asiento
//Funcion aun incompleta
funcion buscarPasajeroNumAsiento(arrayAsientos,nombre,rutasAereas,dni)
	
    Definir i Como Entero
	
    definir encontrado Como Entero
    encontrado=0
	
    Definir numAsientoIngresado Como Entero
	
    Escribir "ingresar numero de asiento"
    leer numAsientoIngresado
	
	
    Para i<-0 Hasta 1 Con Paso 1 Hacer
		
		
        Si  arrayAsientos[i] == numAsientoIngresado  Entonces
			
            encontrado = 1
			
            Escribir "Nombre y Apellido: ",nombre[i]
            Escribir  "Ruta: ",rutasAereas[i]
            Escribir "DNI: ",dni[i]
			
        FinSi
		
		
    FinPara
    si encontrado = 0 Entonces
        Escribir "Numero de asiento no encontrado"
    FinSi
	
	
	
FinFuncion


