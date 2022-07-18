part of 'user.dart';

class UserAdapter extends TypeAdapter<User> {
  static const id = 0;
  static const count = 7;

  @override
  int get typeId => id;

  @override
  User read(BinaryReader reader) {
    final fields = [
      for (var i = 0; i < count; i++) reader.read(),
    ];
    return User(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String,
      gender: fields[4] as Gender,
      birthday: fields[5] as DateTime?,
      phoneNumber: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..write(obj.id)
      ..write(obj.name)
      ..write(obj.email)
      ..write(obj.password)
      ..write(obj.gender)
      ..write(obj.birthday)
      ..write(obj.phoneNumber);
  }
}
