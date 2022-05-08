import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final String creditId;
  final String posterPath;
  final String name;
  final String character;
  const CastEntity({
    required this.creditId,
    required this.posterPath,
    required this.name,
    required this.character,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [creditId];
}
