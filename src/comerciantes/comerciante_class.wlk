import personajes.personaje_class.*
import personajes.personajeNoControlado_class.*
import hechizos.hechizo_class.*
import hechizos.logo_class.*
import hechizos.hechizos.*
import fuerzaOscura.fuerzaOscura.*
import artefactos.artefacto_class.*
import artefactos.artefactos.*
import artefactos.arma_class.*

class Comerciante{
  
  	var property categoria
  	var property artefactos
  	var property comision = 0
  	
  	constructor(_categoria,_artefactos){
  		categoria = _categoria
  		artefactos = _artefactos
  	}
  
  	method consultarPrecio(unProducto){
  		self.validarConsulta(unProducto)
		return categoria.recargo(unProducto.precio(), comision)
	}

	method recategorizacionCompulsiva(){
		comision *=2
		self.categoria(categoria.recategorizaA(comision))
	}
  
	method validarConsulta(unArtefacto){
	    
	    if(!artefactos.contains(unArtefacto)){
	      	throw new Exception("No tiene el producto que se solicita")
	    }
	 }
}

object independiente{
  
  method duplicarComision(comision){
  	return comision * 2
  }
  
  method recargo(unPrecio, comision){
    return unPrecio + ((unPrecio * comision)/100)
  }
  
  method recategorizaA(comision){
  	if(comision > 21){
  		return registrado	
  	}
  	else
  	{
  		return self
  	}
  }
  
}

object registrado{
  method recargo(unPrecio, comision){
    return unPrecio * 1.21
  }
  
  method recategorizaA(comision){
  	return conImpuestoALasGanacias
  }
}

object conImpuestoALasGanacias{
  var property minNoImponible = 0   
  
	method recargo(unPrecio, comision){
	    if(unPrecio > minNoImponible){
	     
	      return (unPrecio + ((unPrecio - minNoImponible) * 0.35))
	      
	    }
	    else{return 0}
	}
	
	method recategorizaA(comision){
		return self
	}
}
