import fuerzaOscura.*
import hechizos.*
import artefactos.*

class Personaje{
	
	var property valorBase 						= 3
	var property hechizoPreferido 				= espectroMalefico
	var property artefactos 					= #{}
	var property luchaBase 						= 1
	
	method nivelDeHechiceria(){
		return (valorBase * hechizoPreferido.poderHechizo()) + fuerzaOscura.valorFuerzaOscura()
	}
	
	method agregaArtefacto(unArtefacto){
		unArtefacto.duenio(self)
		artefactos.add(unArtefacto)
	}
	
	method sacarArtefacto(unArtefacto){
		artefactos.remove(unArtefacto)
	}
	
	method sacarTodosLosArtefactos(){
		artefactos.clear()
	}
	
	method nivelDeHabilidadDeLucha() = luchaBase + self.poderArtefactos()
	method poderArtefactos() = artefactos.sum{ artefacto => artefacto.habilidadDeLucha() }
	
	method tieneMayorHabilidadDeLuchaQueNivelDeHechiceria(){
		return self.nivelDeHabilidadDeLucha() > self.nivelDeHechiceria()
	}
	
	method seCreePoderoso() {
		return hechizoPreferido.esPoderoso()
	}
	
	method estaCargado() {
		return (artefactos.size() >= 5)
	}
	
	method artefactoConHabilidadDeLuchaMax()
	{
		return artefactos.max({unArtefacto => unArtefacto.habilidadDeLucha(self)}).habilidadDeLucha(self)
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