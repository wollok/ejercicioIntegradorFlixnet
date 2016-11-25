object flexnit{
	var contenidos = []
	
	method contenidosNoCalificados(){
		return contenidos.filter({contenido => contenido.sinCalificar()})
	}
	method agregarContenido(contenido){
		contenidos.add(contenido)
	}
	method mismoDirectorYGeneroQue(buscado) {
		return contenidos.filter({contenido => contenido.director() == buscado.contenido() && contenido.genero() == buscado.genero()})
	}	
	method mismoActorQue(buscado) {
		return contenidos.filter({contenido => contenido.mismoActor(buscado) })
	}
	method sugerenciasEstandar(){
		return contenidos.take(3)
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

class Contenido {
	var calificaciones = []
	var titulo

	constructor(_titulo){
		titulo = _titulo
	}
	
	method sinCalificar() {
		return calificaciones.isEmpty()
	}

	method calificacionPromedio(){
		if (self.sinCalificar())
			throw new Exception( "sin calificar")
		return calificaciones.sum() / calificaciones.size()
	}
	method calificar(estrellas){
		calificaciones.add(estrellas)	
	}
	
}

class ContenidoSimple inherits Contenido{
	// Capitulo de serie, película
	var duracion
	var genero
	var director
	var actores = []
	
	constructor(_titulo, _duracion,_genero,_director, _actores) = super(_titulo) {
		duracion = _duracion
		genero = _genero
		director = _director
		actores = _actores
	}
	//method titulo(){return titulo}
	//method duracion() {return duracion}
	method genero(){return genero}
	method director(){return director}
	//method actores() {return actores}
	
	method trabajoActor(actor){
		return actores.contains(actor) 
	}
	method trabajo(persona){
		return self.trabajoActor(persona) or director == persona
	}
	
	method mismoActor(buscado) {
		return actores.any{actor=>buscado.trabajoActor(actor)}
	}
}

class ContenidoCompuesto inherits Contenido{
	//serie, saga, temporada
	var capitulos = []
	constructor(_titulo,_capitulos)= super(_titulo) {
		capitulos = _capitulos
	}
	override method calificar(estrellas){
		super(estrellas)
		capitulos.forEach({unCap => unCap.calificar(estrellas)})	
	}

	method trabajo(persona){
		return capitulos.any({unCapitulo => unCapitulo.trabajo(persona)})
	}	
}



