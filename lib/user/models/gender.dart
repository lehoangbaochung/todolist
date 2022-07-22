import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/common/models/app_localization.dart';

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

  @override
  String toString() {
    switch (this) {
      case Gender.male:
        return AppLocalizations.get(13);
      case Gender.female:
        return AppLocalizations.get(14);
      case Gender.other:
        return AppLocalizations.get(15);
    }
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
