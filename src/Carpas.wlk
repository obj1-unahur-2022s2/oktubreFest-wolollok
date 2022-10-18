import Marcas.*

class Carpa {
	const property limiteDeGente
	const property tieneUnaBandaTradicional
	const property marcaQueVende
	const property gente = []
	
	method dejaIngresarA(persona) {
		return gente.size() < limiteDeGente and not persona.estaEbria()
	}
	method estaEnLaCarpa(persona) {
		return gente.contains(persona)
	}
	method servirJarraDe_LitrosA_(litros, persona) {
		if (self.estaEnLaCarpa(persona)) {
			persona.comprarJarra(new Jarra(capacidad = litros, contenido = marcaQueVende))
		}
		else self.error("La persona no está en la carpa")
	}
	method cantidadDeEbriosEmpedernidos() {
		gente.count{g => g.esEbrioEmpedernido()}
	}
}
