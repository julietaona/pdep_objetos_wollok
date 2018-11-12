import hechizos.hechizo_class.*
import hechizos.logo_class.*

object espectroMalefico inherits Logo("espectro malefico",1){}

object hechizoBasico inherits Hechizo {

	override method poderHechizo() = 10

}

object hechizoNulo{

	const property poderHechizo = 0

}

object hechizoComercial inherits Logo("el hechizo comercial", 2){
	
	var property porcentaje = 20

	override method poderHechizo() = nombreHechizo.length() * (porcentaje/100) * multiplicador

}
