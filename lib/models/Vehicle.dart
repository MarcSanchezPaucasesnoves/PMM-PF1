abstract class Vehicle {
  late String id;
  late int bateriaPercentatge;
  late bool enUs;
  late double preuPerMinut;

  Vehicle({required this.id, required this.bateriaPercentatge, this.enUs = false, required this.preuPerMinut})
  : assert(bateriaPercentatge >= 0 && bateriaPercentatge <= 100, "La bateria ha de ser un nombre entre 0 i 100 inclossos");

  String estatBateria(){
    return switch (bateriaPercentatge) {
      >=80 => "Alta",
      >=20 => "Mitjana",
      _ => "Crítica (Requereix càrrega)"
    };
  }

  double calcularCostReserva(int minuts);
}