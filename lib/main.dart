// import 'package:flutter/material.dart';
import 'package:pf1/models/cotxe.dart';
import 'package:pf1/models/patinet.dart';
import 'package:pf1/models/user.dart';
import 'package:pf1/models/vehicle.dart';

void main() {
  // 1. Inicialitzacio
  // Crea una llista anomenada flota amb almenys 3 Patinets i 2 Cotxes amb diferents nivells de bateria i coordenades inicials.
  User marc = new User("u1", "Marc", 200, "a@a", true);
  User pau = new User.nou(id: "u2", nom: "Pau", correu: "b@b");

  Patinet patinet1 = new Patinet(id: "p1", bateriaPercentatge: 19, preuPerMinut: 10, propietari: marc);
  patinet1.actualitzarUbicacio(10.0, 5.0);

  Patinet patinet2 = new Patinet(id: "p2", bateriaPercentatge: 99, preuPerMinut: 20, propietari: pau);
  patinet2.actualitzarUbicacio(4.0, -5.0);

  Patinet patinet3 = new Patinet(id: "p3", bateriaPercentatge: 33, preuPerMinut: 4, propietari: marc);
  patinet3.actualitzarUbicacio(100.0, -235.0);

  Cotxe cotxe1 = new Cotxe(id: "c1", bateriaPercentatge: 87, preuPerMinut: 100, places: 5, requereixLicencia: true);
  cotxe1.actualitzarUbicacio(1300, 2400);

  Cotxe cotxe2 = new Cotxe(id: "c2", bateriaPercentatge: 71, preuPerMinut: 40, places: 2, requereixLicencia: false);
  cotxe2.actualitzarUbicacio(-200, 1550);

  List<Vehicle> flota = [patinet1, patinet2, patinet3, cotxe1, cotxe2];


  // 2. Cerca i Filtres (Programació Funcional)
  // Filtra i mostra per pantalla quin és el vehicle amb la bateria més alta utilitzant mètodes de col·leccions (reduce o sort).
  Vehicle vehicleAmbMesBateria = flota.reduce((v1, v2) =>
    v1.bateriaPercentatge > v2.bateriaPercentatge ? v1 : v2
  );

  print("El vehicle amb la bateria més alta és $vehicleAmbMesBateria");


  // Obtén una subllista amb tots els vehicles que tinguin una bateria superior al 20% i no estiguin en ús.
  List<Vehicle> vehiclesBateriaSuperior20NoUs = [];
  for (Vehicle vehicle in flota) {
    if (vehicle.bateriaPercentatge > 20 && !vehicle.enUs) {
      vehiclesBateriaSuperior20NoUs.add(vehicle);
    }
  }
  print("Llista de vehicles amb una bateria superior al 20% i que no estàn en ús: $vehiclesBateriaSuperior20NoUs");

  // 3. Simulació d'Ús i Destructuració de Records:
  // Simula que un usuari reserva un Patinet durant 15 minuts. Mostra el cost calculat.
  print("Preu d'un patinet durant 15 minuts on esVIP és ${patinet1.propietari.esVIP}:  ${patinet1.calcularCostReserva(15)}");

  // Actualitza la posició GPS del patinet.
  patinet1.actualitzarUbicacio(0, 1);

  // Extreu les coordenades fent servir la destructuració de Records de Dart 3: var (lat, lng) = patinet.obtenirCoordenades(); i imprimeix-les per consola.
  var (lat: latitudP1, lng: longitudP1) = patinet1.obtenirCoordenades();
  print("Les coordenades del patinet1 són: latitud: $latitudP1 i longitud: $longitudP1");

  // 4. Maneig d'Errors
  // Intenta recarregar el saldo d'un usuari amb un valor negatiu (-10.0€) i gestiona l'error amb un bloc try-catch per evitar que el programa s'aturi bruscament.
  try {
    marc.recarregarSaldo(-10.0);
  } catch (e) {
    print(e);
  }
  print("Encara que hi hagi un error el codi segueix");
}