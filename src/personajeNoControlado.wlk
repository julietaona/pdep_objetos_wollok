import nivel.*
import personaje.*

class PersonajeNoControlado inherits Personaje{
  var property nivelEnElJuego
  
  method nivelDeHabilidadDeLucha(){
    return luchaBase + self.poderArtefactos() * nivelEnElJuego.magnitud()
  }
}

