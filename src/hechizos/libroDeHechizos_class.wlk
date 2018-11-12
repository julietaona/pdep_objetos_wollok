import hechizos.hechizo_class.*

class LibroDeHechizos inherits Hechizo{
	
	var property hechizos = []
	
	method agregarHechizo(nuevoHechizo)
	{
		hechizos.add(nuevoHechizo)
	}
	
	method sacarHechizo(nuevoHechizo) {
		hechizos.remove(nuevoHechizo)
	}
	
	override method esPoderoso() = hechizos.contains({hechizo => hechizo.esPoderoso()})
	
	method hechizosPoderosos() = hechizos.filter({ hechizo => hechizo.esPoderoso() })
	
	override method poderHechizo() = self.hechizosPoderosos().sum({ hechizo => hechizo.poderHechizo()})
		
	override method precio() = (hechizos.size() * 10) + self.poderHechizo()
}
