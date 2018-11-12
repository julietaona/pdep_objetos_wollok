import personajes.personaje_class.*
import personajes.nivel_class.*

class PersonajeNoControlado inherits Personaje {
  var property nivel
  
  constructor(_nivel){
  	nivel = _nivel
  } 
  
  override method nivelDeHabilidadDeLucha() = nivel.magnitud() * (luchaBase + self.poderArtefactos())
}


