import Marcas.*
import Carpas.*

class Persona {
	const peso
	const property jarrasCompradas = []
	const property leGustaEscucharMusica
	const nivelDeAguante
	const paisDeOrigen
	
	method comprarJarra(jarra) {jarrasCompradas.add(jarra)}
	method cantidadDeAlcoholIngerida() = jarrasCompradas.sum({j => j.cantidadDeAlcohol()})
	method estaEbria() = self.cantidadDeAlcoholIngerida() * peso > nivelDeAguante
	method leGusta(cerveza) {return true}
	method quiereEntrarALaCarpa(carpa) {
		return self.leGusta(carpa.marcaQueVende()) and self.cumpleSuPreferenciaMusical(carpa)
	}
	method cumpleSuPreferenciaMusical(carpa) {
		return (self.leGustaEscucharMusica() and carpa.tieneUnaBandaTradicional()) 
				or (not self.leGustaEscucharMusica() and not carpa.tieneUnaBandaTradicional())
		
	}
	method puedeEntrarALaCarpa(carpa) {
		return carpa.dejaIngresarA(self) and self.quiereEntrarALaCarpa(carpa)
	}
	method entrarALaCarpa(carpa){
        if(self.puedeEntrarALaCarpa(carpa)){
            carpa.gente().add(self)
        }
        else self.error("Falla alguna condicion")
    }
    method esEbrioEmpedernido() {
    	return jarrasCompradas.all{j => j.capacidad() >= 1}
    }
    method esPatriota() {
    	return jarrasCompradas.all{j => j.contenido().pais() == paisDeOrigen}
    }
}

class Belga inherits Persona(paisDeOrigen = belgica) {
    override method leGusta(cerveza){
        return cerveza.contenidoLupulo() > 4
    }
}

class Checo inherits Persona(paisDeOrigen = republicaCheca){
    override method leGusta(cerveza){
        return cerveza.graduacion() > 8
    }
}

class Aleman inherits Persona(paisDeOrigen = alemania){
    override method leGusta(cerveza){
        return true
    }
    override method quiereEntrarALaCarpa(carpa) {
    	return super(carpa) and carpa.gente().size().even()
    }
}