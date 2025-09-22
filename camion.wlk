import cosas.*

object camion {
	const property cosas = #{}
	
	method cargar(unaCosa) {
		if(!cosas.contains(unaCosa)){
			cosas.add(unaCosa)	
		}
	}

	method descargar(unaCosa) {
	  if(cosas.contains(unaCosa)){
			cosas.remove(unaCosa)	
		}
	}

	method pesoDelCamión() {
	  return 1000 + cosas.sum({cosa => cosa.peso()})
	}

	method noEstáExcedido() {
	  return (self.pesoDelCamión() < 2500)
	}

	method peligrosidadTotalDelCamión() {
	  return cosas.sum({cosa => cosa.nivelPeligrosidad()})
	}

	method tieneCosasQuePesanEntreY(pesoMín, pesoMáx) {
	  return(self.cosas().any({cosa => cosa.peso() >= pesoMín && cosa.peso() <= pesoMáx}))
	}

	method pesosDeLasCosas() {
		return cosas.map( {cosa => cosa.peso()} )
	}

	method pesoMáximo() {
	  return self.pesosDeLasCosas().max()
	}

	method cosaMásPesada() {
	  return (self.cosas().find({cosa => cosa.peso() == self.pesoMáximo()}))
	}
	method totalDeBultos() {
	  return cosas.sum({cosa => cosa.bultos()})
	}

	method accidente() {
	   cosas.forEach({cosa => cosa.accidente()})
	}

	method transportar(destino, camino) {
	  if(camino.puedeRecorrerCamino(self)){
		self.cosas().forEach({cosa => destino.cargarEnElDestino(cosa)})
		self.cosas().clear()
	  }
	}


}


object almacen {
  const property cosasDelDestino = #{}
  method cargarEnElDestino(unaCosa) {
	cosasDelDestino.add(unaCosa)
  }
}

object ruta9 {
  
method puedeRecorrerCamino(transporte) {
  return (transporte.noEstáExcedido() && transporte.peligrosidadTotalDelCamión() <= 20)
}

}

object caminoVecinal {
  var property pesoMáx = 0

  method puedeRecorrerCamino(transporte) {
  return (transporte.pesoDelCamión() < pesoMáx)
}

}