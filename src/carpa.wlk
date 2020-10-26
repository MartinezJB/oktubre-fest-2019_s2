import marcasYJarras.*
import personas.*
import paises.*

class Carpa {
	var property limite
	var property hayMusicaTradicional
	const property cantPersonas = []
	var property marcaQueVende
	
	method quedaEspacioEnLaCarpa() { return cantPersonas.size() < limite }
	method dejaIngresar(persona) { return self.quedaEspacioEnLaCarpa() && !persona.estaEbria() }
	method agregarA(persona) { if(self.quedaEspacioEnLaCarpa()) {cantPersonas.add(persona) } }
	method estaEnLaCarpa(persona) { return cantPersonas.contains(persona) }
	method servirJarra(persona, capacidad) {
		if(self.estaEnLaCarpa(persona)){
			marcaQueVende.servir(persona) // COMPLETAR: agregar la capacidad
		}
	}
	method cantEbriosEmpedernidos() { return cantPersonas.count({each=>each.esEbrioEmpedernido()}) }
	
}
