import flexnit.*

object distinguido {
	method buscarPropuestas(contenido) =
		empresa.mismoDirectorQue(contenido)  
}

object fanatico {
	method buscarPropuestas(contenido) =
		empresa.mismoActorQue(contenido) 
	
}

object aburrido {
	method buscarPropuestas(usuario) =
		empresa.sugerenciasEstandar()	

}

object apagueLaTele {
	method buscarPropuestas(contenido) = []
}