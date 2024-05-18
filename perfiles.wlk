import flexnit.*

object distinguido {
	method buscarPropuestas(contenido){
		return empresa.mismoDirectorQue(contenido)  
	}
}

object fanatico {
	method buscarPropuestas(contenido){
		return empresa.mismoActorQue(contenido) 
	}
}

object aburrido {
	method buscarPropuestas(usuario){
		return empresa.sugerenciasEstandar()	
	}
}

object apagueLaTele {
	method buscarPropuestas(contenido){
		return []
	}
}