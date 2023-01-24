import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part "database.g.dart";

@DriftDatabase(
  include: {'users.drift'},
  tables: [Users, Ideologies]
)

class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<User>> get allUserEntries => select(users).get();
  Future<List<Ideology>> get allIdeologyEntries => select(ideologies).get();

  Future<Ideology> getIdeologyById(int ideology) {
    return (select(ideologies)..where((t) => t.id.equals(ideology))).getSingle();
  }

  Future<User?> getById(int id) {
    return (select(users)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<Ideology> createIdeology(String ideologyName, String summary, String link) {
    return into(ideologies).insertReturning(
      IdeologiesCompanion.insert(name: ideologyName.toLowerCase(), description: summary, link: link)
    );
  }

  Future setRegion(int userid, String region) {
    User user = User(id: userid, region: region);

    return into(users).insertOnConflictUpdate(user);
  }

  Future setIdeology(int userId, int ideology) {
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