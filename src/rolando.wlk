import fuerzaOscura.*
import hechizos.*
import artefactos.*

object rolando{
	
	var property valorBase 						= 3
	var property hechizoPreferido 				= espectroMalefico
	var property artefactos 					= #{}
	var property luchaBase 						= 1
	
	method nivelDeHechiceria(){
		return (valorBase * hechizoPreferido.poder()) + fuerzaOscura.valor()
	}
	
	method agregaArtefacto(unArtefacto){
		artefactos.add(unArtefacto)
	}
	
	method sacaArtefacto(unArtefacto){
		artefactos.remove(unArtefacto)
	}
	
	method nivelDeHabilidadDelucha(){
		return luchaBase + artefactos.sum{unArtefacto => unArtefacto.habilidadDeLucha(self)}
	}
	
	method tieneMayorHabilidadDeLuchaQueNivelDeHechiceria(){
		return self.nivelDeHabilidadDelucha() > self.nivelDeHechiceria()
	}
	
	method seCreePoderoso() {
		return hechizoPreferido.esPoderoso()
	}
	
	method estaCargado() {
		return (artefactos.size() >= 5)
	}
	
	method artefactoConHabilidadDeLuchaMax()
	{
		return artefactos.max({unArtefacto => unArtefacto.habilidadDeLucha()}).habilidadDeLucha()
	}
	
	method soloTieneEspejoEntreSusArtefactos()
	{
		if(artefactos.size() == 1)
		{
			return artefactos.contains(espejo)
		}
		else
		{
			return false
		}
	}
	
}