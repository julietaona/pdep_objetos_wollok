import personaje.*
import hechizos.*
import fuerzaOscura.*
import artefactos.*

class Comerciante{
  var property tipo
  var property artefactos = []
  var property comision = 0

  method recategorizacionCompulsiva(unImpuesto){
    if (tipo == independiente) {
			tipo.duplicarComision()
			if (tipo.comision() > 21) {
				tipo = registrado
			}
		} else {
			if (tipo == registrado) {
				tipo = conImpuestoALasGanacias
			}
		}
	}
  
  method recategorizar(){
  	tipo.recategorizar(self)
  }
  
  method vender(unasMonedas, unArtefacto){
    self.validarVenta(unasMonedas, unArtefacto)
		return self.precioVenta(unArtefacto)
  }
  
  method precioVenta(unArtefacto){
    return tipo.recargo(unArtefacto.precio()) 
  }
  
  method validarVenta(unasMonedas, unArtefacto){
    if(artefactos.contains(unArtefacto)){
      	throw new Exception("No tiene el producto que se solicita")
    }
    
    if((unasMonedas - self.precioVenta(unArtefacto)) < 0){
    	throw new Exception("No le alcanzan las monedas")	
    }
  }
}

object independiente{
  var property comision
  
  method duplicarComision(){
  	comision = comision * 2
  }
  
  method recargo(unPrecio){
    return unPrecio + ((unPrecio * comision)/100)
  }
  
}

object registrado{
  method recargo(unPrecio){
    return unPrecio * 1.21
  }
}

object conImpuestoALasGanacias{
  var property minNoImponible = 0   
	method recargo(unPrecio){
	    if(minNoImponible - unPrecio < 0){
	      return unPrecio + ((unPrecio - minNoImponible) * 1.35)}
	      else{return 0}
	}
}
