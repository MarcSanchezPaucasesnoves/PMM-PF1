mixin GPSLocation {
  double? latitud;
  double? longitud;

  void actualitzarUbicacio(double lat, double lng){
    latitud = lat;
    longitud = lng;
  }

  Record obtenirCoordenades(){
    return (lat: latitud, lng: longitud);
  }
}