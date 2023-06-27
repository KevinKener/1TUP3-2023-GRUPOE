Proceso SistemaDeVentaDePasajesAéreos
	//Definicion de variables y parametros.
	Definir pasajeros como entero
	Dimension pasajeros[10]
	
	Definir nombre Como Caracter
	Dimension nombre[10]
	
	definir dni como texto
	Dimension dni[10]
	
	Definir telefono como texto
	Dimension telefono[10] 
	
	Definir bodega Como Entero
	Dimension bodega[10]
	
	Definir numPasFrec como texto
	Dimension numPasFrec[10]
	
	
	Definir rutasAereas como entero //array de rutas aereas disponibles
	Dimension rutasAereas[4]	
	
	Definir costoPasajes como entero
	Dimension costoPasajes[10]
	
	
	Definir opcionMenu Como Entero
	Definir salirMenu Como Caracter
	
	
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
				Escribir "Buscar pasaje vendido"
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
