import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Localization {
  static final Localization _singleton = Localization._internal();

  Map<String, dynamic> _localizations = {};
  bool _initialized = false;
  Function? _initCallback = null;

  factory Localization() {
    return _singleton;
  }

  Future<void> init() async {
    Completer completer = Completer(); 

    String content = await File("lib/tables/localization.json").readAsString();
    _localizations = jsonDecode(content);
    _initialized = true;
    completer.complete();
    return completer.future;
  }

  String get(String key, String? locale) {
    if (!_initialized) {
      return "Not Initialized";
    }

    if (!_localizations.containsKey(key)) {
      return "Key not found.";
    }

    if ((_localizations[key]! as Map<String, dynamic>).containsKey(locale)) {
      return _localizations[key]![locale];
    } else {
      return _localizations[key]!["en"];
    }
  }

  Localization._internal();
}