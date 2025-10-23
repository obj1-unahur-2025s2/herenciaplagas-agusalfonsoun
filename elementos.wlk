import plagas.*

class Hogar {
  var mugre
  const confort
  method esBueno() = mugre <= confort * 0.5

  method recibirAtaque(unaPlaga) {
    mugre = mugre + unaPlaga.nivelDeDanio()
  }
}

class Huerta {
  var produccion

  method esBueno() = produccion > niverMinimoDeProduccion.valor()
  
  method recibirAtaque(unaPlaga) {
    produccion = 0.max(produccion - unaPlaga.nivelDeDanio() * 0.10 - 
                 if (unaPlaga.transmiteEnfermedades()) 10 else 0)
  }

}

object niverMinimoDeProduccion {
  var property valor = 10 
}

class Mascota {
  var salud

  method esBueno() = salud > 250 

  method recibirAtaque(unaPlaga) {
    if (unaPlaga.transmiteEnfermedades()) {
      salud = 0.max(salud - unaPlaga.nivelDeDanio())
    }
  }
}

class Barrio {
  const elementos = []

  method agregar(unElemento) {
    elementos.add(unElemento)
  }

  method quitar(unElemento) {
    elementos.remove(unElemento)
  }

  method esCopado() = self.cantidadDeElementosBuenos() > self.cantidadDeElementosNoBuenos()
  method cantidadDeElementosBuenos() = elementos.count({e => e.esBueno()})
  method cantidadDeElementosNoBuenos() = elementos.size() - self.cantidadDeElementosBuenos() 
}