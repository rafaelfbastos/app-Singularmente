class Environments {
  Environments._();

  static String get url => "http://singularmente.ddns.net:1350";
  static String backgroudPath(int id) => 'assets/lotties/backgroud$id.json';
  static String lottiePath(String file) => 'assets/lotties/$file.json';
  static String distance(double? distance) {
    var distanceString = 'Gps não Encontrado';

    if (distance == null) {
    } else if (distance < 1000) {
      distanceString = '${distance.toStringAsFixed(0)} m';
    } else {
      var km = distance / 1000;
      distanceString = '${km.toStringAsFixed(0)} km';
    }

    return distanceString;
  }
}
