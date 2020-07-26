import 'package:movieApp/model/produc_country.dart';

class ProductionCountryResponse {
  final List<ProductionCountry> country;
  final String error;

  ProductionCountryResponse(this.country, this.error);

  ProductionCountryResponse.fromJson(Map<String, dynamic> json)
    : country = 
          (json["production_countries"] as List).map((i) => new ProductionCountry.fromJson(i)).toList(),
          error = "";

  ProductionCountryResponse.withError(String errorValue)
    : country = List(),
      error = errorValue;
}