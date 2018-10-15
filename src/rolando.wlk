import fuerzaOscura.*
import hechizos.*
import artefactos.*

class Personaje{
	
	var property valorBase 						= 3
	var property hechizoPreferido 				= espectroMalefico
	var property artefactos 					= #{}
	var property luchaBase 						= 1
	var property monedas 						= 100
	
	method nivelDeHechiceria(){
		return (valorBase * hechizoPreferido.poderHechizo()) + fuerzaOscura.valorFuerzaOscura()
	}
	
	method agregaArtefacto(unArtefacto){
		unArtefacto.duenio(self)
		artefactos.add(unArtefacto)
	}
	method agregarArtefactos(unosArtefactos) {
		unosArtefactos.forEach({ artefacto => self.agregaArtefacto(artefacto)})		//metodo para agregar mas de un artefacto al mismo tiempo
	}
	
	method sacarArtefacto(unArtefacto){
		artefactos.remove(unArtefacto)
	}
	method sacarTodosLosArtefactos(){			//saca TODOS los artefactos de una
		artefactos.clear()
	}
	
	method sinArtefactos(unArtefacto) = self.artefactos().filter({ artefacto => artefacto != unArtefacto })
	
	method nivelDeHabilidadDeLucha() = luchaBase + self.poderArtefactos()
	method poderArtefactos() = artefactos.sum{ artefacto => artefacto.habilidadDeLucha() }		//por algun motivo de esta forma no rompe los tests de Lucha
	
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
	
}