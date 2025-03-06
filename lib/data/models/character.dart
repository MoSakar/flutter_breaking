// ignore_for_file: public_member_api_docs, sort_constructors_first

class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Map<String, dynamic> origin;
  late Map<String, dynamic> location;
  late String image;
  late List<String> episode;
  late String url;
  late String created;
  // Character({
  //   required this.id,
  //   required this.name,
  //   required this.status,
  //   required this.species,
  //   required this.type,
  //   required this.gender,
  //   required this.origin,
  //   required this.location,
  //   required this.image,
  //   required this.episode,
  //   required this.url,
  //   required this.created,
  // });

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = json['origin'];
    location = json['location'];
    image = json['image'];
    episode = json['episode'];
    url = json['url'];
    created = json['created'];
  }
}
