import 'package:pf1/models/User.dart';
import 'package:pf1/models/Vehicle.dart';

class Patinet extends Vehicle{
  late int velocitatMaxima;
  late User propietari;

  Patinet({required super.id, required super.bateriaPercentatge, super.enUs = false, required super.preuPerMinut, required this.propietari});

  @override
  double calcularCostReserva(int minuts) {
    if (propietari.esVIP) {
      return (minuts * preuPerMinut) * 0.90;
    } else{
      return minuts * preuPerMinut;
    }
  }
}