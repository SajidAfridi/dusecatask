class RideHistory{
  String startLocation;
  String endLocation;
  double price;
  //String date; it should have been included but not
  String country;

  RideHistory({
    required this.startLocation,
    required this.endLocation,
    required this.price,
    required this.country,
  });
}