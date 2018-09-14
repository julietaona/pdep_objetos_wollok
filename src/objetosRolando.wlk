object rolando{
	var valorBase=3
	var hechizoPreferido=espectro
	var artefactos= #{espadaDestino,collarDivino,mascaraOscura}
	method hechizoPreferido(unHechizoPreferido){
		hechizoPreferido=unHechizoPreferido
		return hechizoPreferido
	}
	method nivelDeHechiceria(){
		return(valorBase*hechizoPreferido.poder())+fuerzaOscura.poder()
	}
	method hechizoPreferido(){
		return hechizoPreferido
	}
}

object espectro{
	var nombre="espectro malefico"
	method poder(){
		return nombre.size()
	}
	
	method nombre(unNombre){
		nombre=unNombre
		return nombre
	}
	method poderoso(){
		return nombre.size()>15
	}
}

object hechizoBasico{
	var poder=10
	var poderoso=false
	method poder(){
		return poder
	}
	method poderoso(){
		return poderoso
	}
}

object fuerzaOscura{
	var poder=5
	method poder(){
		return poder
	}
	method poder(unPoder){
		poder=unPoder
	}
	method eclipse(){
		poder*=2
		return poder
	}
}

object espadaDestino{
	var lucha=3
	method lucha(){
		return lucha
	}
}
object collarDivino{
	var perlas
	var lucha=perlas
	method lucha(){
		return lucha
	}
	method perlas(){
		return perlas
	}
}
object mascaraOscura{
	var lucha
}