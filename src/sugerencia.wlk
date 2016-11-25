import flexnit.*
import usuarios.*

class Perfil {
	
	method sugerir(usuario){
		return usuario.elegirNoVisto(self.buscarPropuestas(usuario.ultimoVisto()) ) 
	}
	
	method buscarPropuestas(contenido)
}

object distinguido inherits Perfil{
	override method buscarPropuestas(contenido){
		return flexnit.mismoDirectorYGeneroQue(contenido) 
	}
}

object aburrido inherits Perfil{
	override method buscarPropuestas(usuario){
		return flexnit.sugerenciasEstandar()	
	}
}

object fanatico inherits Perfil{
	override method buscarPropuestas(contenido){
		return flexnit.mismoActorQue(contenido) 
	}
}

object apagueLaTele inherits Perfil{
	override method buscarPropuestas(contenido){
		return []
	}
}