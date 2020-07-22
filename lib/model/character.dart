class Character {
  final int id;
  final String character;
  final String name;
  final String profileImg;

  Character(
    this.id,
    this.character,
    this.name,
    this.profileImg
  );

  Character.fromJson(Map<String, dynamic> json)
  : id = json["cast_id"],
    character = json["character"],
    name = json["name"],
    profileImg = json["profile_path"];

}
