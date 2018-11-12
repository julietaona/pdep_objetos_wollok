class Nivel{
 	const property magnitud
 
 	constructor(_magnitud){
    	magnitud = _magnitud
  	}
}

object facil inherits Nivel(1){}

object moderado inherits Nivel(2){}

object dificil inherits Nivel(4){}