import hechizos.hechizo_class.*

class Logo inherits Hechizo {

	var property nombreHechizo
	var property multiplicador

	constructor(_nombreHechizo, _multiplicador) {
		nombreHechizo = _nombreHechizo
		multiplicador = _multiplicador
	}

	override method poderHechizo() = nombreHechizo.length() * multiplicador

}
