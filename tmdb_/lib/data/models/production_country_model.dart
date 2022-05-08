import '../../domain/entity/production_country.dart';

class ProductionCountryModel extends ProductionCountry {
  ProductionCountryModel({
    required String? iso31661,
    required String? name,
  }) : super(
          iso31661: iso31661,
          name: name,
        );

  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) =>
      ProductionCountryModel(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}
