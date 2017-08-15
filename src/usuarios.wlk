class NoVioNadaException {} //inherits Exception {}
class NoHaySugerenciasException {} // inherits Exception {}

class Usuario{
	var contenidosVistos = [] 
	var calificaciones = []
	var perfil
	
	constructor( p){
		perfil = p
	}
	
	method calificar(contenido,estrellas){
		calificaciones.add(new Calificacion(contenido, estrellas))
		contenido.calificar(estrellas)
	}
	method ver(contenido){
		contenidosVistos.add(contenido)
	}
	method vio(contenido){
		return contenidosVistos.contains(contenido) 
	}
	method calificacionesVistas(){
		return calificaciones.filter({calificacion => self.vio(calificacion.contenido())})
	}
	method mejorCalificado(){
		var calificacionesVistas = self.calificacionesVistas()
		if(calificacionesVistas.isEmpty())
//			throw new NoHaySugerenciasException()
			throw new List()
			
		return (calificacionesVistas.max({calificacion => calificacion.estrellas()})).contenido()
	}
	
	//SUGERENCIAS
	method sugerencia(){
		return self.elegirNoVisto(perfil.buscarPropuestas(self.ultimoVisto()) ) 
	}

	method ultimoVisto(){
	if(contenidosVistos.isEmpty())
		throw new NoVioNadaException()	
	return contenidosVistos.last()
	}
	method elegirNoVisto(propuestas) {
		return propuestas.findOrElse({contenido => !contenidosVistos.contains(contenido)}, {throw new List()})
	}
}

class Calificacion {
	var contenido
	var estrellas
	
	constructor(_audioVisual, _calificacion){
		contenido= _audioVisual
		estrellas= _calificacion 
	}
	method contenido() = contenido
	method estrellas() = estrellas 	
}
