object rolando{
	
	var valorBase 				= 3
	var hechizoPreferido 		= espectroMalefico
	var artefactos 				= #{}
	var luchaBase 				= 1
	
	method hechizoPreferido(unHechizoPreferido){
		hechizoPreferido = unHechizoPreferido
	}
	
	method hechizoPreferido(){
		return hechizoPreferido
	}
	
	method nivelDeHechiceria(){
		return (valorBase * hechizoPreferido.poder()) + fuerzaOscura.valor()
	}
	
	method luchaBase(unaBase){
		luchaBase = unaBase
	}
	
	method luchaBase(){
		return luchaBase
	}
	
	method agregaArtefacto(unArtefacto){
		artefactos.add(unArtefacto)
	}
	
	method sacaArtefacto(unArtefacto){
		artefactos.remove(unArtefacto)i
	}
	
	method lucha(){
		return luchaBase + artefactos.sum{unArtefacto => unArtefacto.lucha(self)}
	}
	
	method tieneMayorHabilidadDeLuchaQueNivelDeHechiceria(){
		return self.lucha() > self.nivelDeHechiceria()
	}
	
	method seCreePoderoso() {
		return hechizoPreferido.poderoso()
	}
	
	method estaCargado() {
		return (artefactos.size() >= 5)
	}
	method artefactos()
	{
		return artefactos
	}
}

object espectroMalefico{
	var nombre = "Espectro malefico"
	
	method poder(){
		return nombre.size()
	}
	
	method nombre(unNombre){
		nombre = unNombre
	}
	
	method nombre(){
		return nombre
	}
	
	method poderoso(){
		return self.poder() > 15
	}
}

object hechizoBasico{
	var poder = 10
	var poderoso = false
	
	method poder(){
		return poder
	}
	method poderoso(){
		return poderoso
	}
}

object libroDeHechizos
{
	var poderoso = true
	var hechizos = []
	
	method hechizos()
	{
		return hechizos
	}
	
	method agregaHechizo(nuevoHechizo)
	{
		hechizos.add(nuevoHechizo)
	}
	
	method poder()
	{
		return hechizos.filter({unHechizo => unHechizo.poderoso()}).sum{unHechizo => unHechizo.poder()}
	}
}

object fuerzaOscura{
	var valor = 5
	
	method valor(){
		return valor
	}
	
	method valor(unValor){
		valor = unValor
	}
	
	method eclipse(){
		valor *= 2
	}
}

object espadaDestino{
	
	var lucha = 3
	
	method lucha(){
		return lucha
	}
}

object collarDivino{
	
	var perlas = 5
	var lucha = perlas
	
	method perlas(unasPerlas){
		perlas = unasPerlas
	}
	
	method perlas(){
		return perlas
	}
	
	method lucha(){
		return perlas
	}
}
object mascaraOscura{
	
	method lucha(){
		if (fuerzaOscura.valor() >= 8)
		{
		    return 1/2 * (fuerzaOscura.valor())
		}
		else{
			return 4
		} 	
	}
}

object armadura{
	
	method lucha(duenio){
		return 2
	}
}
object armaduraSinRefuerzo{
	
	var armadura = armadura.lucha()
	
	method lucha(duenio){
		return armadura;
	}
}

object armaduraConCotaDeMalla{
	
	var armadura = armadura.lucha()
	
	method lucha(duenio){
		return armadura + 1
	}
}

object armaduraConBendicion{
	var armadura = armadura.lucha()
	
	method lucha(duenio)
	{
		return armadura + duenio.nivelDeHechiceria() 
	}
}

object armaduraConHechizoBasico{
	
	var armadura = armadura.lucha()
	
	method lucha(duenio)
	{
		return armadura + hechizoBasico.poder() 
	}
}

object armaduraConHechizoEspectroMalefico
{	
	var armadura = armadura.lucha()
	
	method lucha(duenio)
	{
		return armadura + espectroMalefico.poder() 
	}
}

object espejo{
	
	var armadura = armadura.lucha()
	var artefactosDuenio
	
	method artefactosDuenio(duenio)
	{
		artefactosDuenio = duenio.artefactos()	
	}
	
	method artefactosDuenio()
	{
		return artefactosDuenio
	}
	
	method lucha(duenio)
	{
		self.artefactosDuenio(duenio) 
		//artefactosDuenio.remove(espejo)
		
		if(artefactosDuenio.size() == 0)
		{
			return armadura
		}
		else
		{
			return armadura + artefactosDuenio.max({unArtefacto => unArtefacto.poder()})
		}
	}
}