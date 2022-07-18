extension StringUtils on String? {
  static String get empty => '';

  /// Converts a character in this string to upper case at given position.
  ///
  /// ```dart
  /// 'alphabet'.toUpperCaseAt(0); // 'Alphabet'
  /// 'ABC'.toUpperCaseAt(1); // 'aBc'
  /// ```
  /// This function uses the language independent Unicode mapping and thus only
  /// works in some languages.
  String toUpperCaseAt(int position) {
    return isNull
        ? empty
        : this!.substring(0, position + 1).toUpperCase() +
            this!.substring(position + 1);
  }

  /// Compares this string to [other].
  bool equal(String? other) => this == other;

  /// Compares this string to [other].
  bool difference(String? other) => !equal(other);

  /// Whether this string is null.
  bool get isNull => this == null;

  /// Whether this string is not null.
  bool get isNotNull => !isNull;
}