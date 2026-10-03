mixin GPSLocation {
  double? latitud;
  double? longitud;

  void actualitzarUbicacio(double lat, double lng){
    latitud = lat;
    longitud = lng;
  }

  ({double? lat, double? lng}) obtenirCoordenades(){
    return (lat: latitud, lng: longitud);
  }
}