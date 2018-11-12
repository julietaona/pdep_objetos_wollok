import fuerzaOscura.fuerzaOscura.*
import hechizos.hechizos.*
import artefactos.artefacto_class.*
import artefactos.artefactos.*
import artefactos.arma_class.*
import comerciantes.feriaDeHechiceria.*

class Personaje{
	
	var property valorBase 						= 3
	var property hechizoPreferido 				= espectroMalefico
	var property artefactos 					= #{}
	var property luchaBase 						= 1
	var property monedas 						= 100
	const limiteDePeso 							= 200
	
	method nivelDeHechiceria() = (valorBase * hechizoPreferido.poderHechizo()) + fuerzaOscura.valor()
	
	method seCreePoderoso() = hechizoPreferido.esPoderoso()
	
	method nivelDeHabilidadDeLucha() = luchaBase + self.poderArtefactos()
	method poderArtefactos() = artefactos.sum{ artefacto => artefacto.habilidadDeLucha(self) }
	method traerTodosLosArtefactosMenosUnArtefacto(_unArtefacto) = artefactos.filter{artefacto => artefacto != _unArtefacto}
	
	method agregaArtefacto(unArtefacto){
		self.validarPeso(unArtefacto)
		artefactos.add(unArtefacto)
	}
	method agregarArtefactos(unosArtefactos) {
		unosArtefactos.forEach({ artefacto => self.agregaArtefacto(artefacto)})
	}
	
	method sacarArtefacto(unArtefacto){
		artefactos.remove(unArtefacto)
	}
	method sacarTodosLosArtefactos(){
		artefactos.clear()
	}
	
	method tieneMayorHabilidadDeLuchaQueNivelDeHechiceria() = self.nivelDeHabilidadDeLucha() > self.nivelDeHechiceria()
	
	method estaCargado() = artefactos.size() >= 5

	method objetivoCumplido() {monedas += 10}
	
	method canjearHechizo(_nuevoHechizoPreferido){
		
		const bonus = feriaDeHechiceria.consultarPrecioHechizoEnParteDePago(hechizoPreferido)
		const aPagar = (feriaDeHechiceria.consultarPrecio(_nuevoHechizoPreferido) - bonus).max(0)
		
		self.validarCompra(aPagar, monedas)		
		
		self.pagar(monedas - aPagar)
		
		self.hechizoPreferido(_nuevoHechizoPreferido)																						//finalmente se establece el nuevo hechizo preferido
	}
	
	method validarCompra(montoCompra, monedasDisponibles) {
		if (montoCompra > monedasDisponibles) {
			throw new Exception("No tiene monedas suficientes")
		}
	}

	method adquirirArtefacto(_nuevoArtefacto, _unVendedor) {
		
		const aPagar =  _unVendedor.consultarPrecio(_nuevoArtefacto)
		
		self.validarCompra(aPagar, monedas)
		
		self.pagar(monedas - aPagar)
		
		self.agregaArtefacto(_nuevoArtefacto)
	}
	
	method pagar(nuevaCantidad){self.monedas(nuevaCantidad)}
	
	method validarPeso(artefacto) {
		if (limiteDePeso < artefacto.calcularPeso() + self.pesoTotal()) {
			throw new Exception("No soporta el peso")
		}
	}

	method pesoTotal() = artefactos.sum{ artefacto => artefacto.calcularPeso() }
		
}
