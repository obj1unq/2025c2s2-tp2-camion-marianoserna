object knightRider {
	method bultos() = 1 
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method esPesoPar() {
		return (self.peso() % 2 == 0)
	}

	method accidente() {
	}
}

object arenaAGranename {
	const nivelPeligrosidad = 1
	var property peso = 0
	method bultos() = 1

	method nivelPeligrosidad() = nivelPeligrosidad
  	method esPesoPar() {
		return (self.peso() % 2 == 0)
	}

	method accidente() {
	  peso = peso +20
	}

}

object bumblebee {
	
	var property estadoBumblebee = auto
	method peso() = 800 
	method nivelPeligrosidad() {
		return estadoBumblebee.nivelPeligrosidad()
	}
	method bultos() = 2
	
	method esPesoPar() {
		return (self.peso() % 2 == 0)
	}

	method accidente() {
	  if(estadoBumblebee == auto){
		estadoBumblebee = robot
	  }else if(estadoBumblebee == robot){
		estadoBumblebee = auto
	  }
	}




}

object auto {
	method nivelPeligrosidad(){
		return 15
	}
}

object robot {
	method nivelPeligrosidad(){
		return 30
	}
}

object paqueteDeLadrillos {

	var property cantidadDeLadrillos = 0
	
	method nivelPeligrosidad(){
		return 2
	}
	method peso() {
	  return cantidadDeLadrillos * 2
	}

	method esPesoPar() {
		return (self.peso() % 2 == 0)
	}

	method bultos() {
		if(cantidadDeLadrillos < 100){
			return 1
		} else if (cantidadDeLadrillos >= 101 && cantidadDeLadrillos <= 300){
			return 2
		} else {
			return 3
		}
	  
	}

	method accidente() {
	  cantidadDeLadrillos = cantidadDeLadrillos - 12
	  if(cantidadDeLadrillos < 0){
		cantidadDeLadrillos = 0
	  }
	}




}

object bateríaAntiaéreae {
  var property tieneMisiles = true

  method peso() {
	if(self.tieneMisiles()){
		return 300
	} else {
		return 200
	}
  }

	method nivelPeligrosidad() {
	if(self.tieneMisiles()){
		return 100
	} else {
		return 0
	}
  }

  method esPesoPar() {
		return (self.peso() % 2 == 0)
	}

	method bultos() {
		if(tieneMisiles){
			return 2
		} else {
			return 1
		}
	}

	method accidente() {
	  tieneMisiles = false
	}


}

object residuosRadioactivos{
	var property peso = 0
	method nivelPeligrosidad() {
	  return 200
	} 
	method bultos() = 1

	method esPesoPar() {
		return (self.peso() % 2 == 0)
	}

	method accidente() {
	  peso = peso + 15
	}


}


object contenedorPortuario {
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
	
	method peso() {
	  return 100 + cosas.sum({cosa => cosa.peso()})
	}

	method nivelPeligrosidad() {
		if(self.cosas().size() > 0){
			return cosas.map({cosa => cosa.nivelPeligrosidad()}).max()
		} else {
			return 0
		}
	  
	}
	method bultos() {
		return 1 + cosas.sum({cosa => cosa.bultos()})
	}

	method accidente() {
	  cosas.forEach({cosa => cosa.accidente()})
	}


}

object embalajeDeSeguridad {

	var property cosaQueEnvuelve = bumblebee

	method peso() {
	  return cosaQueEnvuelve.peso()
	}
  
	method nivelPeligrosidad() {
	  return cosaQueEnvuelve.nivelPeligrosidad() / 2
	}

	method bultos() = 2
	method accidente() {
		cosaQueEnvuelve.accidente()
	}
}