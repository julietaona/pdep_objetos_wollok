class Hechizo {

	method esPoderoso() = self.poderHechizo() > 15

	method poderHechizo()

	method precio() = self.poderHechizo()

	method calcularPeso() = 0

}

object hechizoBasico inherits Hechizo {

	override method poderHechizo() = 10

	override method esPoderoso() = false

}

object hechizoNulo {

	const property poderHechizo = 0

}

class Logo inherits Hechizo {

	var property nombreHechizo
	var property multiplicador = new Range(1, 10).anyOne()

	constructor(_nombreHechizo) {
		nombreHechizo = _nombreHechizo
	}

	constructor(_nombreHechizo, _multiplicador) {
		nombreHechizo = _nombreHechizo
		multiplicador = _multiplicador
	}

	override method poderHechizo() = nombreHechizo.length() * self.factorMultiplicador()

	method factorMultiplicador() = self.multiplicador()

}

object espectroMalefico inherits Logo("espectro malefico") {

	override method poderHechizo() = nombreHechizo.length()

}

class HechizoComercial inherits Logo {

	var property porcentaje

	constructor(_nombre, _multiplicador, _porcentaje) = super(_nombre, _multiplicador) {
		porcentaje = _porcentaje
	}

	override method factorMultiplicador() = (self.porcentaje() / 100) * self.multiplicador()

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

