import fuerzaOscura.*
import hechizos.*

object espadaDestino{
	
	var property habilidadDeLucha = 3
	
	method habilidadDeLucha(duenio){
		return habilidadDeLucha
	}
}

object collarDivino{
	
	var property perlas = 5
	
	method habilidadDeLucha(duenio){
		return perlas
	}
}

object mascaraOscura{
	
	method habilidadDeLucha(duenio){	
		return 4.max(fuerzaOscura.valor()/2)
	}
	
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
		return armadura.habilidadDeLucha(duenio) + hechizoBasico.cantidadDePoder() 
	}
}

object armaduraConHechizoEspectroMalefico
{	
	
	method habilidadDeLucha(duenio)
	{
		return armadura.habilidadDeLucha(duenio) + espectroMalefico.cantidadDePoder() 
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