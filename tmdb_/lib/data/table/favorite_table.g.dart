part of 'favorite_table.dart';

class FavoriteTableAdapter extends TypeAdapter<FavoriteTable> {
  @override
  final int typeId = 0;

  @override
  FavoriteTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteTable(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteTable obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
