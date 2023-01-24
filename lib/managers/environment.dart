// ignore_for_file: file_names
import "package:dotenv/dotenv.dart";

class Environment {
  static final Environment _singleton = Environment._internal();

  final DotEnv _environment = DotEnv(includePlatformEnvironment: true)..load();

  factory Environment() {
    return _singleton;
  }

  String? get(String key) {
    return _environment[key];
  }

  Environment._internal();
}