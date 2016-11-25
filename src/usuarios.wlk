import flexnit.*

class Usuario{
	var nombre
	var apellido
	var edad
	var contenidosVistos = [] 
	var calificaciones = []
	var tipoDeUsuario
	
	constructor(_nombre, _apellido, _edad, _tipoDeUsuario){
		nombre = _nombre
		apellido = _apellido
		edad = _edad
		tipoDeUsuario = _tipoDeUsuario
	}
//	method audioVisualesVistos(){return audioVisualesVistos}
//	method audioVisualesCalificados(){return audioVisualesCalificados}
	
	method calificar(contenido,estrellas){
		calificaciones.add(new Calificacion(contenido, estrellas))
		contenido.calificar(estrellas)
	}
	method verAudioVisual(contenido){
		contenidosVistos.add(contenido)
	}
	method contenidoVisto(contenido){
		return contenidosVistos.contains(contenido) 
	}
	method vistosYCalificados(){
		return calificaciones.filter({calificacion => self.contenidoVisto(calificacion.contenido())})
	}
	method mejorCalificado(){
		var vistosYCalificados = self.vistosYCalificados()
		if(vistosYCalificados.isEmpty())
			throw new Exception("no califico nada de lo que vio")
		return (vistosYCalificados.max({calificacion => calificacion.estrellas()})).contenido()
	}
	method ultimoVisto(){
		return contenidosVistos.last()
	}
	method elegirNoVisto(propuestas) {
		return propuestas.find({contenido => !contenidosVistos.contains(contenido)})
	}
}