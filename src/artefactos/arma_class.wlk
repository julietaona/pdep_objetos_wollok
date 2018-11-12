import artefactos.artefacto_class.*

class Arma inherits Artefacto{ //espadas, hachas y lanzas
	var property unidadesDeLucha = 3

	constructor(_peso) = super(_peso)

	method habilidadDeLucha(poseedor) = unidadesDeLucha
	method precio() = peso * 5
}
