class ProductionCountry {
  final String iso;
  final String name;

  ProductionCountry(
    this.iso,
    this.name,
  );

  ProductionCountry.fromJson(Map<String, dynamic> json)
        : iso = json["iso_3166_1"],
          name = json["name"];
}