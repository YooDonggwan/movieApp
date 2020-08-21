class Cast {
  final int id;
  final String cast;
  final String name;
  final String profileImg;

  Cast(
    this.id,
    this.cast,
    this.name,
    this.profileImg
  );

  Cast.fromJson(Map<String, dynamic> json)
  : id = json["cast_id"],
    cast = json["character"],
    name = json["name"],
    profileImg = json["profile_path"];

}
