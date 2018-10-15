import fuerzaOscura.*
import hechizos.*

class Artefacto {

	var property duenio = null

	method duenio(_duenio) {
		if (duenio != null) {
			duenio.sacarArtefacto(self)
		}
		duenio = _duenio
	}

}

class Arma inherits Artefacto {
	
	var property habilidadDeLucha = 3
	
	method habilidadDeLucha(){
		return habilidadDeLucha
	}
}

object collarDivino inherits Artefacto{
	
	var property perlas = 5
	
	method habilidadDeLucha(){
		return perlas
	}
}

class Mascara inherits Artefacto{
	var property indiceOscuridad
	var property minimo = 4

	constructor(_indiceOscuridad) {
		if (_indiceOscuridad < 0 || _indiceOscuridad > 1) {
			throw new Exception("El indice de oscuridad "+_indiceOscuridad+" no es valido, tiene que estar entre 0 y 1")
		}
		indiceOscuridad = _indiceOscuridad
	}

	method habilidadDeLucha()=((fuerzaOscura.valorFuerzaOscura() / 2) * indiceOscuridad).max(minimo)
}

object armadura{
	
	method habilidadDeLucha(duenio){
		return 2
	}
}
object armaduraSinRefuerzo{
	
	method habilidadDeLucha(duenio){
		return armadura.habilidadDeLucha(duenio);
	}
}

object armaduraConCotaDeMalla{
	
	method habilidadDeLucha(duenio){
		return armadura.habilidadDeLucha(duenio) + 1
	}
}

object armaduraConBendicion{
	
	method habilidadDeLucha(duenio)
	{
		return armadura.habilidadDeLucha(duenio) + duenio.nivelDeHechiceria() 
	}
}

object armaduraConHechizoBasico{
	
	method habilidadDeLucha(duenio)
	{
		return armadura.habilidadDeLucha(duenio) + hechizoBasico.poderHechizo() 
	}
}

object armaduraConHechizoEspectroMalefico
{	
	
	method habilidadDeLucha(duenio)
	{
		return armadura.habilidadDeLucha(duenio) + espectroMalefico.poderHechizo() 
	}
}

object espejo{
	
	method sinEspejo(duenio)
	{
		return duenio.artefactos().filter({unArtefacto => unArtefacto != self}) 	
	}
	
	method habilidadDeLucha(duenio)
	{
		if(duenio.soloTieneEspejoEntreSusArtefactos())
		{
			return 0
		}
		else
		{
			return duenio.valorDelArtefactoConHabilidadDeLuchaMax()
		}
	}

}