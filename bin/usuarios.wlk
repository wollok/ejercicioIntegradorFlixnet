class NoVioNadaException inherits Exception {}
class NoHaySugerenciasException inherits Exception {}

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
	method vistosYCalificados(){
		return calificaciones.filter({calificacion => self.vio(calificacion.contenido())})
	}
	method mejorCalificado(){
		var vistosYCalificados = self.vistosYCalificados()
		if(vistosYCalificados.isEmpty())
			throw new NoVioNadaException()
			
		return (vistosYCalificados.max({calificacion => calificacion.estrellas()})).contenido()
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
		return propuestas.findOrElse({contenido => !contenidosVistos.contains(contenido)}, {throw new NoHaySugerenciasException()})
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
