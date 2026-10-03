import 'package:pf1/models/Vehicle.dart';

class Cotxe extends Vehicle{
  late int places;
  late bool requereixLicencia;

  Cotxe({required super.id, required super.bateriaPercentatge, super.enUs = false, required super.preuPerMinut, required this.places, required this.requereixLicencia});

  @override
  double calcularCostReserva(int minuts) {
    const double suplementFiltreEcologic = 2.0;

    return (minuts * preuPerMinut) + suplementFiltreEcologic;
  }
}