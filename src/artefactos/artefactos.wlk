import fuerzaOscura.fuerzaOscura.*
import hechizos.hechizos.*
import artefactos.artefacto_class.*

object collarDivino inherits Artefacto(0){	
	var property perlas = 5

	method habilidadDeLucha(poseedor) = perlas
	method precio() = perlas * 2
	override method pesoAgregado() = 0.5 * perlas
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

	method habilidadDeLucha(poseedor) = ((fuerzaOscura.valor() / 2) * indiceOscuridad).max(minimo)
	method precio() = 10 * self.indiceOscuridad()
	override method pesoAgregado() = ((((fuerzaOscura.valor() / 2) * indiceOscuridad) - 3).max(0))
}

class Armadura inherits Artefacto {
	var property refuerzo = sinRefuerzo
	const property poderDeLuchaBase = 2

	constructor(_peso) = super(_peso)
	
	method valorDeRefuerzo(poseedor) = refuerzo.valorDeRefuerzo(poseedor)
	method habilidadDeLucha(poseedor) = poderDeLuchaBase + self.valorDeRefuerzo(poseedor)
	
	method precio() = refuerzo.precioComoRefuerzo(self)
	override method pesoAgregado() = refuerzo.pesoComoRefuerzo()
}

class CotaDeMalla{
	const property unidadDeLucha

	constructor(_unidadDeLucha) {
		unidadDeLucha = _unidadDeLucha
	}
	
	method valorDeRefuerzo(poseedor) = self.unidadDeLucha()
	method precioComoRefuerzo(armadura) = unidadDeLucha / 2
	method pesoComoRefuerzo() = 1
}

object bendicion{
	method valorDeRefuerzo(poseedor) = poseedor.nivelDeHechiceria()
	method precioComoRefuerzo(armadura) = armadura.poderDeLuchaBase()
	method pesoComoRefuerzo() = refuerzoLiviano.peso()
}

object sinRefuerzo{
	method valorDeRefuerzo(poseedor) = 0
	method precioComoRefuerzo(armadura) = 2
	method pesoComoRefuerzo() = refuerzoLiviano.peso()	
}

object refuerzoLiviano{
	method peso() = 0
}

class Espejo inherits Artefacto {
	
	constructor(_peso) = super(_peso)
	
	method habilidadDeLucha(poseedor) {
		const artefactos = poseedor.traerTodosLosArtefactosMenosUnArtefacto(self)
		if (artefactos.size() == 0) {
			return 0
		}
		
		return artefactos.map{ artefacto => artefacto.habilidadDeLucha(poseedor) }.max()
	}
	
	method precio() = 90
}
