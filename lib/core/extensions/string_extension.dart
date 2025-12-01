extension StringExtension on String {
  bool get isSvg => split('.').last == 'svg';

  String get toSnakeCase => replaceAllMapped(
    RegExp(r'[A-Z]'),
    (match) => '_${match.group(0)!.toLowerCase()}',
  ).replaceFirst(RegExp(r'^_'), '');
}
