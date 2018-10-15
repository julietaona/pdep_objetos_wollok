class Logo{
	var property nombreHechizo
	var property multiplicador = new Range(1, 10).anyOne()			//sirve para darle un multiplicador aleatorio al nuevo hechizo que creeemos

	constructor(unNombreHechizo) {
		nombreHechizo = unNombreHechizo
	}

	constructor(unNombreHechizo, unMultiplicador) {
		nombreHechizo = unNombreHechizo
		multiplicador = unMultiplicador
	}
	
	method poderHechizo(){
		return nombreHechizo.size() * multiplicador
	}
	
	method esPoderoso(){
		return self.poderHechizo() > 15
	}
	method precio() = self.poderHechizo()
}

object espectroMalefico{
	var property nombre = "Espectro malefico"
	
	method poderHechizo(){
		return nombre.size()
	}
	
	method esPoderoso(){
		return self.poderHechizo() > 15
	}
}

object hechizoBasico{
	var property poderHechizo = 10
	var property esPoderoso = false
	const property precio = 10
}

class LibroDeHechizos
{
	var property hechizos = []
	
	method agregarHechizo(nuevoHechizo)
	{
		hechizos.add(nuevoHechizo)
	}
	method sacarHechizo(nuevoHechizo) {
		hechizos.remove(nuevoHechizo)
	}
	
	method hechizosPoderosos() = hechizos.filter({ hechizo => hechizo.esPoderoso() })
	method poderHechizo() = self.hechizosPoderosos().sum({ hechizo => hechizo.poderHechizo() })
		
	method precio() = (hechizos.size() * 10) + self.poderHechizo()
}