class Country {
  String code;
  String name;
  String continent;

  Country({required this.code, required this.name, required this.continent});
}

class Countries {
  static final Countries _instance = Countries._internal();

  final Map<String, Country> _countries = {};

  factory Countries() {
    return _instance;
  }

  Country? get(String code) {
    return _countries[code];
  }

  void init(Map<String, dynamic> json) {
    for (final element in json.entries) {
      _countries[element.key] = Country(code: element.key, name: element.value["name"], continent: element.value["continent"]);
    }
  }

  Countries._internal();
}