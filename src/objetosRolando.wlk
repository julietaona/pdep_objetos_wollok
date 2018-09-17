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
		artefactos.remove(unArtefacto)
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
	
	method lucha(duenio){
		return lucha
	}
}

object collarDivino{
	
	var perlas = 5
	
	method perlas(unasPerlas){
		perlas = unasPerlas
	}
	
	method perlas(){
		return perlas
	}
	
	method lucha(duenio){
		return perlas
	}
}
object mascaraOscura{
	
	method lucha(duenio){
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
	
	method lucha(duenio){
		return armadura.lucha(duenio);
	}
}

object armaduraConCotaDeMalla{
	
	method lucha(duenio){
		return armadura.lucha(duenio) + 1
	}
}

object armaduraConBendicion{
	
	method lucha(duenio)
	{
		return armadura.lucha(duenio) + duenio.nivelDeHechiceria() 
	}
}

object armaduraConHechizoBasico{
	
	method lucha(duenio)
	{
		return armadura.lucha(duenio) + hechizoBasico.poder() 
	}
}

object armaduraConHechizoEspectroMalefico
{	
	
	method lucha(duenio)
	{
		return armadura.lucha(duenio) + espectroMalefico.poder() 
	}
}

object espejo{
	
	
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
		artefactosDuenio.remove(self)
		
		if(artefactosDuenio.size() == 0)
		{
			return 0
		}
		else
		{
			artefactosDuenio.sum({unArtefacto => unArtefacto.lucha(duenio)})
			return armadura.lucha(duenio) + artefactosDuenio.max({unArtefacto => unArtefacto.lucha(duenio)})
		}
	}
}