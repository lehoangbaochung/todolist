import 'package:hive_flutter/hive_flutter.dart';

import '/common/models/setting_provider.dart';

part 'language_adapter.dart';
part 'language_dictionary.dart';
part 'language_key.dart';

@HiveType(typeId: LanguageAdapter.id)
enum Language {
  @HiveField(0)
  en,

  @HiveField(1)
  vi;

  static List<String> get names => values.map((lang) => lang.name).toList();

  static final Language instance = SettingProvider.box.get(
    SettingProvider.language,
    defaultValue: Language.en,
  );

  static Map<String, String> get dictionary {
    switch (instance) {
      case Language.en:
        return LanguageDictionary.vi;
      case Language.vi:
        return LanguageDictionary.vi;
    }
  }

  factory Language.parseIndex(int index) {
    return Language.values.singleWhere(
      (language) => language.index == index,
      orElse: () => Language.en,
    );
  }

  @override
  String toString() {
    switch (this) {
      case Language.en:
        return 'English';
      case Language.vi:
        return 'Tiếng Việt';
    }
  }
}
