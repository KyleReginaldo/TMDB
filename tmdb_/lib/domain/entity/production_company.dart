import 'package:equatable/equatable.dart';

class ProductionCompany extends Equatable {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  @override
  List<Object> get props => [];
}
