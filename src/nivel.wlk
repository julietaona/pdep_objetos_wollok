class Nivel{
 var property magnitud
  constructor(_magnitud){
    magnitud = _magnitud
  }
}

object facil inherits Nivel(0){
}

object moderado inherits Nivel(2){
}

object dificil inherits Nivel(4){
}
