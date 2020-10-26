import marcasYJarras.*
import carpa.*
import paises.*

class Persona {
	var property peso
	var property leGustaMusicaTradicional
	var property nvlAguante
	var property paisDeOrigen
	const jarrasCompradas = []
	const marcasFavoritas = #{}
	
	method alcoholIngerido() { return jarrasCompradas.sum({each=>each.contenidoDeAlcohol()}) }
	method estaEbria() { return self.alcoholIngerido() * peso > nvlAguante }
	method leGusta(marca) { return marcasFavoritas.contains(marca) }
	
	method quiereEntrar(carpa) {
		const leGustaLaMusicaDeLaCarpa = leGustaMusicaTradicional == carpa.hayMusicaTradicional()
		return self.leGusta(carpa.marcaQueVende()) && leGustaLaMusicaDeLaCarpa
	}
	
	method puedeEntrar(carpa) { return self.quiereEntrar(carpa) && carpa.dejaIngresar(self) }
	method entrarA(carpa) {
		if(self.puedeEntrar(carpa)) {
			carpa.agregarA(self)
		}
	}
	method comprarCerveza(jarra) { jarrasCompradas.add(jarra) }
	method esEbrioEmpedernido() { return self.estaEbria() && jarrasCompradas.all({each=>each.capacidad() >= 1}) }
	method esPatriota() { return jarrasCompradas.all({each=>each.procedencia() == paisDeOrigen}) }
}
