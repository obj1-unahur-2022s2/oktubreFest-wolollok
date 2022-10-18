class Cerveza {
	const property contenidoLupulo
	const property pais
	var property graduacionReglamentariaNegra = 5
	
}

class Rubia inherits Cerveza {
	const property graduacion
}

class Negra inherits Cerveza {
	const property graduacion = graduacionReglamentariaNegra.min(contenidoLupulo*2)
	/*method graduacion() = contenidoLupulo.min(graduacionReglamentariaNegra)*/
}

class Roja inherits Cerveza {
	const property graduacion = graduacionReglamentariaNegra.min(contenidoLupulo*2) * 1.25
	/*method graduacion() = graduacionReglamentariaNegra.min(contenidoLupulo*2) * 1.25*/
}

class Jarra {
	const property capacidad
	const property contenido
	
	method cantidadDeAlcohol() = capacidad * (contenido.graduacion()*0.01)
}

object belgica {
	
}

object alemania {
	
}

object republicaCheca {
	
}

object mexico {
	
}
