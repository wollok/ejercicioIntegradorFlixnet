import usuarios.*
import perfiles.*
import flexnit.*
 
object fixture {
	const juan = new Usuario(fanatico)
	const ana = new Usuario(distinguido)

	const laHistoria = new ContenidoSimple("La Historia Oficial", 112, "Puenzo", ["Aleandro", "Alterio"])
	const elSecreto = new ContenidoSimple("El secreto de sus ojos", 140, "Campanella", ["Darin", "Villamil","Francella"])
	const luna = new ContenidoSimple("Luna de Avellaneda", 123, "Campanella", ["Moran", "Darin"])
	const relatos = new ContenidoSimple("Relatos Salvajes", 124, "Szifron", ["Sbaraglia", "Darin"])
	
	const simpsonC1T1 = new ContenidoSimple("Los Simpson Capitulo 1 Temporada 1", 40, "Groening", [])
	const simpsonC2T1 = new ContenidoSimple("Los Simpson Capitulo 2 Temporada 1", 40, "Groening", [])
	const simpsonC3T1 = new ContenidoSimple("Los Simpson Capitulo 3 Temporada 1", 40, "Groening", [])
	const simpsonC1T2 = new ContenidoSimple("Los Simpson Capitulo 1 Temporada 2", 40, "Groening", [])
	const simpsonC2T2 = new ContenidoSimple("Los Simpson Capitulo 2 Temporada 2", 40, "Groening", ["Bart"])
	const simpsonT1 = new ContenidoCompuesto("Los Simpson Temporada 1", [simpsonC1T1,simpsonC2T1,simpsonC3T1])
	const simpsonT2 = new ContenidoCompuesto("Los Simpson Temporada 2", [simpsonC1T2,simpsonC2T2])
	const simpson = new ContenidoCompuesto("Los Simpson", [simpsonT1,simpsonT2])
	
	method juan() = juan
	method ana() = ana

	method laHistoria() = laHistoria 
	method elSecreto() = elSecreto 
	method luna() = luna
	method relatos() = relatos

	method simpson() = simpson
	method simpsonT1() = simpsonT1
	method simpsonC1T1() = simpsonC1T1
	method simpsonC2T1() = simpsonC2T1
	
	method escenarioBasico() {
		juan.ver(luna)
		juan.ver(elSecreto)
		juan.calificar(laHistoria ,5)
		juan.calificar(elSecreto, 3)
		juan.calificar(luna, 1)
		ana.calificar(laHistoria,3)
		ana.ver(elSecreto)
		empresa.agregarContenido(luna)
		empresa.agregarContenido(laHistoria)
		empresa.agregarContenido(elSecreto)
		empresa.agregarContenido(relatos)
	}
	
	method escenarioAvanzado() {
		self.escenarioBasico()		
		
		juan.ver(simpsonC1T1)
		juan.ver(simpsonC2T1)
		ana.ver(simpsonC2T1)
		juan.calificar(simpsonC1T1 ,1)
		juan.calificar(simpsonT1 ,3)
		ana.calificar(simpson, 5)

		empresa.agregarContenido(simpsonC1T1)
		empresa.agregarContenido(simpsonC2T1)
		empresa.agregarContenido(simpsonC3T1)
		empresa.agregarContenido(simpsonC1T2)
		empresa.agregarContenido(simpsonC2T2)
		empresa.agregarContenido(simpsonT1)
		empresa.agregarContenido(simpsonT2)
		empresa.agregarContenido(simpson)
		
	}

}
