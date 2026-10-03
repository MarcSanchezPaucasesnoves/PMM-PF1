import 'package:pf1/exceptions/UserException.dart';

class User {
  late String _id, _nomComplet, correu;
  late double _saldo;
  late bool esVIP;

  User.nou({required String id, required String nom, required String correu, bool esVIP = false}){
    _id = id;
    _nomComplet = nom;
    this.correu = correu;
    this.esVIP = esVIP;
    _saldo = 0.0;
  }

  User(String id, String nom, double saldo, String correu, bool esVIP){
    _id = id;
    _nomComplet = nom;
    _saldo = saldo;
    this.correu = correu;
    this.esVIP = esVIP;
  }


  String get id {
    return _id;
  }

  double get saldo{
    return _saldo;
  }


  void recarregarSaldo(double quantitat){
    if (quantitat < 0) {
      throw UserException("La quantitat a recarregar no pot ser menor a zero.");
    } else if (quantitat == 0){
      throw UserException("La quantitat a recarregar no pot ser zero.");
    }

    _saldo += quantitat;
  }   

}