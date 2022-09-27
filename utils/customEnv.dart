import 'dart:io';

class CustomEnv {
  final Map<String, String> _map = {};
  static CustomEnv instace = CustomEnv._();

  CustomEnv._() {
    _init();
  }

  void _init({String path = '.env'}) {
    final file = File(path);
    final envText = file.readAsStringSync();

    for (var line in envText.split('\n')) {
      final lineBreak = line.split('=');
      _map[lineBreak[0]] = lineBreak[1];
    }
  }

  String? operator [](String key) {
    return _map[key];
  }
}
