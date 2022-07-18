import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: GenderAdapter.id)
enum Gender {
  @HiveField(0)
  male,

  @HiveField(1)
  female,

  @HiveField(2, defaultValue: true)
  other;

  factory Gender.parseIndex(int index) {
    return Gender.values.singleWhere(
      (gender) => gender.index == index,
      orElse: () => Gender.other,
    );
  }

  factory Gender.parseName(String name) {
    return Gender.values.singleWhere(
      (gender) => gender.name == name,
      orElse: () => Gender.other,
    );
  }
}

class GenderAdapter extends TypeAdapter<Gender> {
  static const id = 1;

  @override
  int get typeId => id;

  @override
  Gender read(BinaryReader reader) {
    return Gender.parseIndex(reader.readByte());
  }

  @override
  void write(BinaryWriter writer, Gender obj) {
    writer.writeByte(obj.index);
  }
}
