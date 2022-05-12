class Accomodation {
  final String name;
  final String description;
  String address;
  List<String> images;
  double rate;
  String location;

  Accomodation({
    this.name = "Default Name",
    this.description = "Default Description",
    this.address = "Address",
    this.images = const [],
    this.rate = 5.0,
    this.location = "",
  });
}
