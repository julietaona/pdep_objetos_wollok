class Hechizo {

	method esPoderoso() = self.poderHechizo() > 15

	method poderHechizo()

	method precio() = self.poderHechizo()
	
	method precioComoRefuerzo(armadura) = armadura.poderDeLuchaBase() + self.precio()
	
	method valorDeRefuerzo(poseedor) = self.poderHechizo() 
	
	method pesoComoRefuerzo(){
		if(self.poderHechizo() % 2 == 0){
			return 2	
		}
		else{
			return 1	
		}
	}

	method calcularPeso() = 0

}