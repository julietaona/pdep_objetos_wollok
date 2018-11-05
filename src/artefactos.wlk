import fuerzaOscura.*
import hechizos.*

class Artefacto {
	var property peso
	var property fechaCompra = new Date()

	constructor(_peso) {
		peso = _peso
	}

	method calcularPeso() = self.peso() - self.desgaste()

	method desgaste() = ((new Date() - fechaCompra) / 100).min(1)

	method peso(duenio) = peso + self.pesoAgregado(duenio)

	method pesoAgregado(duenio) = 0
}

class Arma inherits Artefacto {
	var property habilidadDeLucha = 3

	constructor(_peso) = super(_peso)

	method poderDeLucha() = habilidadDeLucha
	method precio() = peso * 5
}

object collarDivino inherits Artefacto(0){	
	var property perlas = 5

	method habilidadDeLucha(duenio) = perlas
	method precio() = self.perlas() * 2
	override method pesoAgregado(duenio) = (0.5 * self.perlas())
}

class Mascara inherits Artefacto{
	var property indiceOscuridad
	var property minimo = 4

	constructor(_indiceOscuridad, _peso) = super(_peso) {
		if (!_indiceOscuridad.between(0,1)) {
			throw new Exception("El indice de oscuridad "+_indiceOscuridad+" no es valido, tiene que estar entre 0 y 1")
		}
		indiceOscuridad = _indiceOscuridad
	}

	method habilidadDeLucha(duenio) = ((fuerzaOscura.valor() / 2) * indiceOscuridad).max(minimo)
	method precio() = 10 * self.indiceOscuridad()
	override method pesoAgregado(duenio) = ((self.habilidadDeLucha(duenio) - 3).max(0))
}

class Armadura inherits Artefacto {
	var property refuerzo = sinRefuerzo
	const property poderDeLuchaBase = 1

	constructor(_peso) = super(_peso)

	method cambiarRefuerzo(_refuerzo) {
		refuerzo = _refuerzo
	}
	method valorDeRefuerzo() = refuerzo.valorDeRefuerzo(self)
	method nivelHechiceriaDuenio(duenio) = duenio.nivelDeHechiceria()
	method habilidadDeLucha() = poderDeLuchaBase + self.valorDeRefuerzo()
	method precio() = refuerzo.precioRefuerzo(self)
	override method pesoAgregado(duenio) = refuerzo.peso()
}
class RefuerzoLiviano {
	method peso() = 0
}
object sinRefuerzo inherits RefuerzoLiviano{
	method valorDeRefuerzo(armadura) = 0
	method precioRefuerzo(armadura) = 2	
}
class RefuerzoDeCotaDeMalla{
	const property unidadDeLucha

	constructor(_unidadDeLucha) {
		unidadDeLucha = _unidadDeLucha
	}
	
	method valorDeRefuerzo(armadura) = self.unidadDeLucha()
	method precioRefuerzo(armadura) = self.unidadDeLucha() / 2
	method peso() = 1
}

object refuerzoDeBendicion inherits RefuerzoLiviano {
	method valorDeRefuerzo(armadura) = armadura.nivelHechiceriaDuenio()
	method precioRefuerzo(armadura) = armadura.poderDeLuchaBase()
}

class RefuerzoDeHechizo {
	var property hechizoRefuerzo = hechizoNulo

	method valorDeRefuerzo(armadura) = self.poderHechizo()
	method poderHechizo() = hechizoRefuerzo.poderHechizo()
	method precioRefuerzo(armadura) = hechizoRefuerzo.precio() + armadura.poderDeLuchaBase()
	method peso() = if (self.poderHechizo().even()) 2 else 1
}

class Espejo inherits Artefacto {
	constructor() = super(0)
	
	method habilidadDeLucha(duenio) {
		const artefactos = duenio.traerTodosLosArtefactosMenosUnArtefacto(self)
		if (artefactos.size() == 0) {
			return 0
		}
		return artefactos.map{ artefacto => artefacto.habilidadDeLucha() }.max()
	}
	method precio() = 90
}
