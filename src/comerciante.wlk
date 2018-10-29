class Comerciante{
  var porperty tipo
  var property comision
  var property impuestoGanancias
  var property minNoImponible
  var artefactos = []

  method recategorizacionCompulsiva(unImpuesto){
    tipo.recategorizacion(unImpuesto)
  }
  
  method vender(unArtefacto){
    self.validarVenta(unArtefacto)
		return self.precioVenta(unArtefacto)
  }
  
  method precioVenta(unArtefacto){
    return tipo.recargo(unArtefacto.precio()) 
  }
  
  method validarVenta(unArtefacto){
    if(artefactos.filter{artefacto => artefacto == unArtefcato}){
      throw new Exception("No tiene el producto que se solicita")
    }
  }
}

object independiente inherits Comerciante{

  method recategorizacion(){
    if(comision > 21){
      comision = comision * 2
    }
  }
  
  method recargo(unPrecio){
    return unPrecio + comision
  }
  
}

object registrado inherits Comerciante{
  method recategorizacion(unImpuesto){
    impuestoGanancias = unImpuesto
  }
  
  method recargo(unPrecio){
    return unPrecio * 1.21
  }
}

object conImpuestoALasGanacias inherits Comerciante{ 
  method recargo(unPrecio){
    if(minNoImponible - unPrecio < 0){
      return unPrecio + ((unPrecio - minNoImponible) * 1.35)
    }
  }
  
  method recategorizacion(){}
}
