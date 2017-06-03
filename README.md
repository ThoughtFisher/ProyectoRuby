# ProyectoRuby

Vamos a construir un simple juego de reto 5 en Ruby con la interfaz de la linea de comando. El objetivo del juego es que un usuario pueda ingresar la respuesta a cada pregunta que le vamos haciendo y que el juego le responda si la respuesta fue correcta o no. En caso de que si sea correcta seguimos con una nueva pregunta, en caso de que no le indicamos al usuario que vuelva a intentar ingresando una nueva respuesta.

Este es un ejemplo de como se vería el juego funcionando en la linea de comandos:  

$ ruby reto5.rb

	
	Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!

	Definición

	Un tipo de archivo en el que todos los valores están delimitados por comas.

	Adivininar: YAML

	Incorrecto!, Trata de nuevo 

	Adivinar: XML

	Incorrecto!, Trata de nuevo

	Adivinar: CSV

	Correcto!

	Definición

	(Así continua)

#----------------------------------------------------------------------------------------------------

Pasos a seguir: 

Paso 0 : Diseño 

Escoge tu modelo de datos y el flujo de control

Puede que ya tengas una imagen clara de como diseñar tu programa, pero siempre es una buena idea articular tus conceptos usando pseudocode, wireframes, o otras herramientas de modelaje. Deberias ser capaz de escribir un bosquejo de tanto el modelo de datos como el flujo de control del programa. 

En este paso no deberias demorarte mas de 15-20 minutos. Si estas gastando mas de eso, preguntale a un mentor que te preste ayuda. 

Algunas preguntas que te puedes hacer:

Entiendes completamente la logica del juego?

que clases (estado y comportamiento) necesitas?

Cuales son las responsabilidades de cada clase? 

Que metodos deberían ser publicos? cuales deberian ser privados?

Una vez  tengas este plan en lugar, crea un archivo esqueleto de tu aplicación. 

-Archivo de definiciones y respuestas: 

El siguiente paso es resolver la pregunta de donde van a venir las definiciones. Una forma muy sencilla de lograr esto es utilizando un archivo .txt el cual puede contener definiciones y preguntas de la siguiente manera:

#------
Crear un segundo nombre para una variable metodo (Definicion)
alias (Respuesta)

Usado para definir una funcion (Definicion)
def (Respuesta) 
#------

Esta es una forma muy basica de guardar los datos sobre las definiciones y las respuestas. Definición en una linea, respuesta en la siguiente y un espacio en blanco entre definiciones. 

#----------------------------------------------------------------------------------------------------

Paso 1:  Construyelo 

Ahora que tienes un bosquejo general de la aplicación y datos con que trabajar, es hora de construir tu aplicación. 

Piensa detenidamente sobre como cada pieza del rompecabezas encaja. Construye la aplicación detenidamente y pruébela a medida que la vas construyendo. Por ahora saltate la interfaz de usuario (La parte de aplicación que recibe y responde al input del usuario). Puedes fingir el input del usuario creando un metodo en una de tus clases que adivine resultados y luego realize las acciones necesarias. Mas tarde podrás enganchar este comportamiento al input del usuario real. 

Algunas preguntas para que consideres: 

Como vas a generar objetos de preguntas y respuestas basados en archivo de texto?

como van a interactuar tus clases

Donde debería vivir la logica de del juego? 

Diseño de la interfaz de usuario: 

Para este punto, ya deberias tener todos componentes claves de tu aplicación construidos. 

Finalmente, es hora de implementar la parte interactiva del juego: La pieza que te dejara jugar con tu propia interfaz de usuario. 

Piensa en que clase de inputs y outputs tu debería tener tu interfaz  y escribe el código que corresponda a estos. 

Algunas preguntas para considerar:

Como verificas que la respuesta del jugador es correcta? Donde debería vivir esta logica?

Que sucede cuando el jugador empieza el juego? 

que sucede cuando el jugador termina el juego?

como manejas respuestas incorrectas?

Finalmente termina de escribir tu aplicación!