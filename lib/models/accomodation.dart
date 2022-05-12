class Accomodation {
  final String name;
  final String description;
  String address;
  List<String> images;
  int rate;
  String location;
  bool rated;

  Accomodation({
    this.name = "Default Name",
    this.description = "Default Description",
    this.address = "Address",
    this.images = const [],
    this.rate = 5,
    this.location = "",
    this.rated = false,
  });
}
