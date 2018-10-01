object espectroMalefico{
	var property nombre = "Espectro malefico"
	
	method cantidadDePoder(){
		return nombre.size()
	}
	
	method esPoderoso(){
		return self.cantidadDePoder() > 15
	}
}

object hechizoBasico{
	var property cantidadDePoder = 10
	var property esPoderoso = false
}

object libroDeHechizos
{
	var property hechizos = []
	
	method agregarHechizo(nuevoHechizo)
	{
		hechizos.add(nuevoHechizo)
	}
	
	method cantidadDePoder()
	{
		return hechizos.filter({unHechizo => unHechizo.esPoderoso()}).sum{unHechizo => unHechizo.cantidadDePoder()}
	}
}