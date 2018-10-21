class Logos{
	const property nombreHechizo
	const property multiplicador

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
	const property precio = 10
	
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
