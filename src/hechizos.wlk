class Logo{
	var property nombreHechizo
	var property multiplicador = new Range(1, 10).anyOne()

	constructor(_nombreHechizo) {
		nombreHechizo = _nombreHechizo
	}

	constructor(_nombreHechizo, _multiplicador) {
		nombreHechizo = _nombreHechizo
		multiplicador = _multiplicador
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
}

object libroDeHechizos
{
	var property hechizos = []
	
	method agregarHechizo(nuevoHechizo)
	{
		hechizos.add(nuevoHechizo)
	}
	
	method poderHechizo()
	{
		return hechizos.filter({unHechizo => unHechizo.esPoderoso()}).sum{unHechizo => unHechizo.poderHechizo()}
	}
}