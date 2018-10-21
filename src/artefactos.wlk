import fuerzaOscura.*
import hechizos.*

class Artefacto {
	var property duenio = null

	method duenio(_duenio) {
		if (duenio) {
			duenio.sacarArtefacto(self)
		}
		duenio = _duenio
	}
}

class Arma inherits Artefacto {
	var property habilidadDeLucha = 3
	
	method precio() = self.habilidadDeLucha() * 5
}

object collarDivino inherits Artefacto{	
	var property perlas = 5
	
	method habilidadDeLucha(){
		return perlas
	}
	method precio() = self.perlas() * 2
}

class Mascara inherits Artefacto{
	var property indiceOscuridad
	var property minimo = 4

	constructor(_indiceOscuridad) {
		if (!_indiceOscuridad.between(0,1)) {
			throw new Exception("El indice de oscuridad "+_indiceOscuridad+" no es valido, tiene que estar entre 0 y 1")
		}
		indiceOscuridad = _indiceOscuridad
	}

	method habilidadDeLucha()=((fuerzaOscura.valorFuerzaOscura() / 2) * indiceOscuridad).max(minimo)
}

class Armadura inherits Artefacto {
	var property refuerzo = sinRefuerzo
	const property poderDeLuchaBase = 1

	method cambiarRefuerzo(unRefuerzo) {		//un setter para modificar el refuerzo
		refuerzo = unRefuerzo
	}
	method habilidadDeLucha() = poderDeLuchaBase + self.valorDeRefuerzo()
	method valorDeRefuerzo() = refuerzo.valorDeRefuerzo(self)
	method precio() = refuerzo.precioRefuerzo(self)
	
}
object sinRefuerzo{
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
	
}

object refuerzoDeBendicion {

	method valorDeRefuerzo(armadura) = armadura.duenio().nivelDeHechiceria()
	method precioRefuerzo(armadura) = armadura.poderDeLuchaBase()

}

class RefuerzoDeHechizo {
	var property hechizoRefuerzo = hechizoNulo		//se hace para iniciar con 0 en el poder de hechizo

	method valorDeRefuerzo(armadura) = hechizoRefuerzo.poderHechizo()
	method precioRefuerzo(armadura) = hechizoRefuerzo.precio() + armadura.poderDeLuchaBase()

}
object hechizoNulo {
	const property poderHechizo = 0
}

class Espejo inherits Artefacto {
	
	method habilidadDeLucha() {
		const artefactos = duenio.sinArtefactos(self)
		if (artefactos.size() == 0) {
			return 0
		}
		return artefactos.map{ artefacto => artefacto.habilidadDeLucha() }.max()
	}
	method precio() = 90
}
