part of 'language.dart';

class LanguageAdapter extends TypeAdapter<Language> {
  static const id = 4;

  @override
  int get typeId => id;

  @override
  Language read(BinaryReader reader) {
    return Language.parseIndex(reader.readByte());
  }

  @override
  void write(BinaryWriter writer, Language obj) {
    writer.writeByte(obj.index);
  }
}
