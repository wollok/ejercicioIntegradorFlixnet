object empresa{
	var contenidos = []
	
	method sinCalificar(){
		return contenidos.filter({contenido => contenido.sinCalificar()})
	}
	method agregarContenido(contenido){
		contenidos.add(contenido)
	}
	method mismoDirectorQue(buscado) {
		return contenidos.filter({contenido => contenido.mismoDirector(buscado)})
	}	
	method mismoActorQue(buscado) {
		return contenidos.filter({contenido => contenido.mismoActor(buscado)})
	}
	method sugerenciasEstandar(){
		return contenidos.take(3)
	}		
	
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
	method mismoActor(actor){
		return false
	}
	
	method mismoDirector(buscado) {
		return false
	}
	
}

class ContenidoSimple inherits Contenido{
	// Capitulo de serie o película
	var duracion
	var director
	var actores = []
	
	constructor( tit, dur, dir, act) = super( tit) {
		duracion = dur
		director = dir
		actores = act
	}
	//method titulo(){return titulo}
	//method duracion() {return duracion}
	//method actores() {return actores}
	method director(){return director}
	
	method trabajoActor(actor){
		return actores.contains(actor) 
	}
	
	method trabajo(persona){
		return self.trabajoActor(persona) or director == persona
	}
	
	override method mismoDirector(buscado) {
		return director == buscado.director()
	}
	override method mismoActor(buscado) {
		return actores.any{actor=>buscado.trabajoActor(actor)}
	}
}

class ContenidoCompuesto inherits Contenido{
	//serie, saga, temporada
	var capitulos = []
	constructor( tit, caps)= super(tit) {
		capitulos = caps
	}
	override method calificar(estrellas){
		super(estrellas)
		capitulos.forEach({unCap => unCap.calificar(estrellas)})	
	}

	method trabajo(persona){
		return capitulos.any({unCapitulo => unCapitulo.trabajo(persona)})
	}	
}



