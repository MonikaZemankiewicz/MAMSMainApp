class Event {
  final String name;
  final String description;
  String address;
  List<String> images;
  String location;

  Event({
    this.name = "Default Name",
    this.description = "Default Description",
    this.address = "Address",
    this.images = const [],
    this.location = "",
  });
}
