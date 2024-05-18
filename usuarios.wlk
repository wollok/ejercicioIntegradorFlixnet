class NoVioNadaException inherits Exception {}

class NoHaySugerenciasException inherits Exception {}

class Usuario {
	const contenidosVistos = []
	const calificaciones = []
	const perfil
	
	method calificar(contenido, estrellas) {
		calificaciones.add(
			new Calificacion(contenido = contenido, estrellas = estrellas)
		)
		contenido.calificar(estrellas)
	}
	
	method ver(contenido) {
		contenidosVistos.add(contenido)
	}
	
	method vio(contenido) = contenidosVistos.contains(contenido)
	
	method calificacionesVistas() = calificaciones.filter(
		{ calificacion => self.vio(calificacion.contenido()) }
	)
	
	method mejorCalificado() {
		const calificacionesVistas = self.calificacionesVistas()
		if (calificacionesVistas.isEmpty()) {
			throw new NoHaySugerenciasException()
		}
		return calificacionesVistas.max(
			{ calificacion => calificacion.estrellas() }
		).contenido()
	} //SUGERENCIAS
	
	method sugerencia() = self.elegirNoVisto(
		perfil.buscarPropuestas(self.ultimoVisto())
	)
	
	method ultimoVisto() {
		if (contenidosVistos.isEmpty()) {
			throw new NoVioNadaException()
		}
		return contenidosVistos.last()
	}
	
	method elegirNoVisto(propuestas) = propuestas.findOrElse(
		{ contenido => !contenidosVistos.contains(contenido) },
		{ throw new NoHaySugerenciasException() }
	)
}

class Calificacion {
	var property contenido
	var property estrellas
}