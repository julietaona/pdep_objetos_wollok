class Artefacto {
	
	var property peso
	var property fechaCompra = new Date()
	
	constructor(_peso) {
		peso = _peso
	}

	method calcularPeso() = self.peso() - self.desgaste()

	method desgaste() = ((new Date() - fechaCompra) / 100).min(1)

	method peso() = peso + self.pesoAgregado()

	method pesoAgregado() = 0
}