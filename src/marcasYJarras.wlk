import carpa.*
import personas.*
import paises.*

class Marca {
	const graduacionReglamentaria = 10
	var property lupulo
	var property pais
}

class MarcaRubia inherits Marca {
	var property graduacion 
	// no lo puse en la superClase porque en cada marca tiene una iniciacion distinta. en esta clase lo puse como una variable
	//por el hecho que se establece el valor 
}

class MarcaNegra inherits Marca {
	method graduacion() {return graduacionReglamentaria.min(lupulo * 2)}
}

class MarcaRoja inherits Marca {
	method graduacion() { return graduacionReglamentaria.min(lupulo * 2) * 1.25 }
}

class Jarra {
	var property capacidad
	var property marca
	
	method procedencia() { return marca.pais() }
	method contenidoDeAlcohol() { return marca.graduacion() * 0.5 }
	method servir(persona) { persona.comprarCerveza(self) }
}