object rolando{
	var valorBase=3
	var hechizoPreferido=espectro
	var artefactos= #{espadaDestino,collarDivino,mascaraOscura}
	var luchaBase=1
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
	method luchaBase(unaBase){
		luchaBase=unaBase
	}
	method agregaArtefacto(unArtefacto){
		artefactos.add(unArtefacto)
	}
	method sacaArtefacto(){
		var unArtefacto=artefactos.anyOne()
		artefactos.remove(unArtefacto)
		return unArtefacto
	}
	method lucha(){
		return luchaBase+artefactos.sum{unArtefacto => unArtefacto.lucha()}
	}
	method luchador(){
		return luchaBase+artefactos.sum{unArtefacto => unArtefacto.lucha()}>(valorBase*hechizoPreferido.poder())+fuerzaOscura.poder()
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
	var perlas=0
	var lucha=perlas
	method perlas(unasPerlas){
		perlas=unasPerlas
		return perlas
	}
	method lucha(){
		return perlas
	}
}
object mascaraOscura{
	var lucha
	method lucha(){
		return 1/2 * (fuerzaOscura.poder())
	}
}