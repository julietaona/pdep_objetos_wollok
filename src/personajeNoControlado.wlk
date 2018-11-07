import personaje.*

class PersonajeNoControlado inherits Personaje {
  var property dificultad
  
  override method nivelDeHabilidadDeLucha() = dificultad.magnitud() * (luchaBase + self.poderArtefactos())
}

class Dificultad {
 const property magnitud
  constructor(_magnitud){
    magnitud = _magnitud
  }
}