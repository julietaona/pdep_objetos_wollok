
object rolando{
	var valorBase=3
	var hechizoPreferido=espectro
	method hechizoPreferido(unHechizoPreferido){
		hechizoPreferido=unHechizoPreferido
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
	var esPoderoso=true
	method poder(){
		return nombre.size()
	}
	method nombre(unNombre){
		nombre=unNombre
	}
}

object hechizoBasico{
	var poder=10
	var esPoderoso=false
}

object fuerzaOscura{
	var poder=5
	method poder(){
		return poder
	}
	method poder(unPoder){
		poder=unPoder
	}
	method elipse(){
		poder*=2
	}
}
