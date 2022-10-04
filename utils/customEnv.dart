import 'dart:io';
import 'parserExtension.dart';

class CustomEnv {
  static Map<String, String> _map = {};

  static Future<String> _readFile({String file = '.env'}) async {
    String f = await File(file).readAsString();
    return f;
  }

  static Future<void> _load() async {
    List<String> linhas = (await _readFile()).split('\r\n');
    _map = {for (var l in linhas) l.split('=')[0]: l.split('=')[1]};
  }

  static Future<T> get<T>({required String key}) async {
    if (_map.isEmpty) await _load();
    return _map[key]!.toType(T);
  }
}
