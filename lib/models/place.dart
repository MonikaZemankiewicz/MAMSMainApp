class Place {
  final String name;
  final String description;
  String address;
  String audio;
  List<String> images;
  int rate;
  String video;
  String location;
  bool rated;

  Place({
    this.name = "Default Name",
    this.description = "Default Description",
    this.address = "Address",
    this.audio = "audio1.mp3",
    this.images = const [],
    this.rate = 5,
    this.video = "1.mp4",
    this.location = "",
    this.rated = false,
  });
}
