extension ParserExtension on String {
  toType(Type type) {
    switch (type) {
      case String:
        return toString();
        break;
      case int:
        return int.parse(toString());
      default:
        return toString();
    }
  }
}
