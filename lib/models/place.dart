class Place {
  final String name;
  final String description;
  String address;
  String audio;
  List<String> images;
  double rate;
  String video;
  String location;

  Place({
    this.name = "Default Name",
    this.description = "Default Description",
    this.address = "Address",
    this.audio = "audio1.mp3",
    this.images = const [],
    this.rate = 5.0,
    this.video = "1.mp4",
    this.location = "",
  });
}
