import 'dart:convert';
import 'dart:io';

class Localization {
  static final Localization _singleton = Localization._internal();

  Map<String, Map<String, String>> localizations = {};

  factory Localization() {
    return _singleton;
  }

  void init() {
    File("lib/tables/localization.json").readAsString().then((String content) {
      localizations = jsonDecode(content);
    });
  }

  String? get(String key, String locale) {
    if (!localizations.containsKey(key)) {
      return null;
    }

    if (localizations[key]!.containsKey(locale)) {
      return localizations[key]![locale];
    } else {
      return localizations[key]!["en"];
    }
  }

  Localization._internal();
}