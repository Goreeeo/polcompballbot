import 'package:tuple/tuple.dart';

class TestParser {
  static final TestParser _singleton = TestParser._internal();

  factory TestParser() {
    return _singleton;
  }

  List<double>? parseSapply(Uri src) {
    if (src.queryParameters["right"] == null || src.queryParameters["auth"] == null || src.queryParameters["prog"] == null) {
      return null;
    }

    List<double> returnable = [];

    returnable.add(double.parse(src.queryParameters["right"] as String));
    returnable.add(double.parse(src.queryParameters["auth"] as String));
    returnable.add(double.parse(src.queryParameters["prog"] as String));

    return returnable;
  }

  List<double>? parseDozen(Uri src) {
    if (src.queryParameters["score"] == null) {
      return null;
    }

    List<String> scores = src.queryParameters["score"]!.split(",");

    List<double> returnable = List.generate(scores.length, (index) => double.parse(scores[index]));

    return returnable;
  }

  List<double>? parseEcon(Uri src) {
    if (src.queryParameters["equi"] == null || src.queryParameters["hori"] == null || src.queryParameters["dema"] == null || src.queryParameters["cent"] == null || src.queryParameters["auto"] == null || src.queryParameters["comm"] == null || src.queryParameters["birt"] == null || src.queryParameters["unio"] == null) {
      return null;
    }

    List<double> returnable = [];
    returnable.add(double.parse(src.queryParameters["equi"] as String));
    returnable.add(double.parse(src.queryParameters["hori"] as String));
    returnable.add(double.parse(src.queryParameters["dema"] as String));
    returnable.add(double.parse(src.queryParameters["cent"] as String));
    returnable.add(double.parse(src.queryParameters["auto"] as String));
    returnable.add(double.parse(src.queryParameters["comm"] as String));
    returnable.add(double.parse(src.queryParameters["birt"] as String));
    returnable.add(double.parse(src.queryParameters["unio"] as String));
    return returnable;
  }

  List<double>? parseEight(Uri src) {
    if (src.queryParameters["e"] == null || src.queryParameters["d"] == null || src.queryParameters["g"] == null || src.queryParameters["s"] == null) {
      return null;
    }

    List<double> returnable = [];
    returnable.add(double.parse(src.queryParameters["e"] as String));
    returnable.add(double.parse(src.queryParameters["d"] as String));
    returnable.add(double.parse(src.queryParameters["g"] as String));
    returnable.add(double.parse(src.queryParameters["s"] as String));
    return returnable;
  }

  Tuple2<String, List<double>>? parseCompass(Uri src) {
    if (src.queryParameters["ec"] == null || src.queryParameters["soc"] == null) {
      return null;
    }

    String image = "https://www.politicalcompass.org/chart?ec=${src.queryParameters["ec"] as String}&soc=${src.queryParameters["soc"] as String}";

    List<double> returnable = [];
    returnable.add(double.parse(src.queryParameters["ec"] as String));
    returnable.add(double.parse(src.queryParameters["soc"] as String));

    return Tuple2(image, returnable);
  }

  List<double>? parseCultural(Uri src) {
    if (src.queryParameters["v1"] == null || src.queryParameters["v3"] == null || src.queryParameters["v5"] == null || src.queryParameters["v7"] == null || src.queryParameters["v9"] == null || src.queryParameters["v11"] == null || src.queryParameters["v13"] == null || src.queryParameters["v15"] == null || src.queryParameters["v17"] == null || src.queryParameters["v19"] == null || src.queryParameters["v21"] == null || src.queryParameters["v23"] == null) {
      return null;
    }

    List<double> returnable = [];
    returnable.add(double.parse(src.queryParameters["v1"] as String));
    returnable.add(double.parse(src.queryParameters["v3"] as String));
    returnable.add(double.parse(src.queryParameters["v5"] as String));
    returnable.add(double.parse(src.queryParameters["v7"] as String));
    returnable.add(double.parse(src.queryParameters["v9"] as String));
    returnable.add(double.parse(src.queryParameters["v11"] as String));
    returnable.add(double.parse(src.queryParameters["v13"] as String));
    returnable.add(double.parse(src.queryParameters["v15"] as String));
    returnable.add(double.parse(src.queryParameters["v17"] as String));
    returnable.add(double.parse(src.queryParameters["v19"] as String));
    returnable.add(double.parse(src.queryParameters["v21"] as String));
    returnable.add(double.parse(src.queryParameters["v23"] as String));

    return returnable;
  }

  TestParser._internal();
}