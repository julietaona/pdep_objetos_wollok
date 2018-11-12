object feriaDeHechiceria{
	
	method consultarPrecioHechizoEnParteDePago(hechizoPreferido){
		return self.consultarPrecio(hechizoPreferido) / 2
	}
	
	method consultarPrecio(unProducto){
		return unProducto.precio()
	}
	
}
