import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part "database.g.dart";

@DriftDatabase(
  include: {'users.drift'},
  tables: [Users]
)

class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<User>> get allUserEntries => select(users).get();

  Future<User?> getById(int id) {
    return (select(users)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future setRegion(int userid, String region) {
    User user = User(id: userid, region: region);

    return into(users).insertOnConflictUpdate(user);
  }

  Future setDozenValues(int userid, String link) {
    User user = User(id: userid, dozenvalues: link);

    return into(users).insertOnConflictUpdate(user);
  }

  Future setEconValues(int userid, String link) {
    User user = User(id: userid, econvalues: link);

    return into(users).insertOnConflictUpdate(user);
  }

  Future setEightValues(int userid, String link) {
    User user = User(id: userid, eightvalues: link);

    return into(users).insertOnConflictUpdate(user);
  }

  Future setSapplyValues(int userid, String sapplyLink) {
    User user = User(id: userid, sapplyvalues: sapplyLink);

    return into(users).insertOnConflictUpdate(user);
  }

  Future setPoliticalCompass(int userid, String link) {
    User user = User(id: userid, politicalcompass: link);

    return into(users).insertOnConflictUpdate(user);
  }

  Future setCulturalValues(int userid, String link) {
    User user = User(id: userid, culturalvalues: link);

    return into(users).insertOnConflictUpdate(user);
  }

  Future setIdeology(int userId, String ideology) {
    User user = User(id: userId, ideology: ideology);

    return into(users).insertOnConflictUpdate(user);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final file = File(p.join(p.current, "db.sqlite"));

    return NativeDatabase.createInBackground(file);
  });
}