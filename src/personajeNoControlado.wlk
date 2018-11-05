import nivel.*
import personaje.*

class PersonajeNoControlado inherits Personaje{
  var property nivelEnElJuego
  
  override method nivelDeHabilidadDeLucha(){
    return luchaBase + self.poderArtefactos() * nivelEnElJuego.magnitud()
  }
}

