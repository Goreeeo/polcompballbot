import 'package:polcompballbot/database/database.dart';

class StringIdeologyConverter {
  static final StringIdeologyConverter _singleton = StringIdeologyConverter._internal();

  Map<String, int> ideologies = {};

  factory StringIdeologyConverter() {
    return _singleton;
  }

  void init() async {
    List<Ideology> ideologies = await Database().allIdeologyEntries;

    for (var ideology in ideologies) {
      this.ideologies[ideology.name.toLowerCase()] = ideology.id;
    }
  }

  int? getIdeology(String name) {
    return ideologies[name.toLowerCase()];
  }

  void add(Ideology ideology) {
    ideologies[ideology.name.toLowerCase()] = ideology.id;
  }

  StringIdeologyConverter._internal();
}