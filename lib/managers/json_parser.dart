import 'dart:async';
import 'dart:convert';
import 'dart:io';

class JsonParser {
  static final JsonParser _instance = JsonParser._internal();

  Map<String, Map<String, dynamic>> _jsonCache = {};

  factory JsonParser() {
    return _instance;
  }

  Future<Map<String, dynamic>?> read(String file) async {
    if (_jsonCache.containsKey(file)) {
      return _jsonCache[file];
    }

    String content = await File("lib/tables/$file.json").readAsString();
    Map<String, dynamic> returnable = jsonDecode(content);
    _jsonCache[file] = returnable;
    return returnable;
  }

  JsonParser._internal();
}