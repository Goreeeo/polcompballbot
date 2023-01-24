// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Ideologies extends Table with TableInfo<Ideologies, Ideology> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Ideologies(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [id, name, description, link];
  @override
  String get aliasedName => _alias ?? 'ideologies';
  @override
  String get actualTableName => 'ideologies';
  @override
  VerificationContext validateIntegrity(Insertable<Ideology> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ideology map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ideology(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
    );
  }

  @override
  Ideologies createAlias(String alias) {
    return Ideologies(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Ideology extends DataClass implements Insertable<Ideology> {
  final int id;
  final String name;
  final String description;
  final String link;
  const Ideology(
      {required this.id,
      required this.name,
      required this.description,
      required this.link});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['link'] = Variable<String>(link);
    return map;
  }

  IdeologiesCompanion toCompanion(bool nullToAbsent) {
    return IdeologiesCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      link: Value(link),
    );
  }

  factory Ideology.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ideology(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      link: serializer.fromJson<String>(json['link']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'link': serializer.toJson<String>(link),
    };
  }

  Ideology copyWith(
          {int? id, String? name, String? description, String? link}) =>
      Ideology(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        link: link ?? this.link,
      );
  @override
  String toString() {
    return (StringBuffer('Ideology(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, link);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ideology &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.link == this.link);
}

class IdeologiesCompanion extends UpdateCompanion<Ideology> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> link;
  const IdeologiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.link = const Value.absent(),
  });
  IdeologiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String link,
  })  : name = Value(name),
        description = Value(description),
        link = Value(link);
  static Insertable<Ideology> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? link,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (link != null) 'link': link,
    });
  }

  IdeologiesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? description,
      Value<String>? link}) {
    return IdeologiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      link: link ?? this.link,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IdeologiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('link: $link')
          ..write(')'))
        .toString();
  }
}

class Users extends Table with TableInfo<Users, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY');
  static const VerificationMeta _ideologyMeta =
      const VerificationMeta('ideology');
  late final GeneratedColumn<int> ideology = GeneratedColumn<int>(
      'ideology', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'REFERENCES ideologies(id)');
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
      'region', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [id, ideology, region];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ideology')) {
      context.handle(_ideologyMeta,
          ideology.isAcceptableOrUnknown(data['ideology']!, _ideologyMeta));
    }
    if (data.containsKey('region')) {
      context.handle(_regionMeta,
          region.isAcceptableOrUnknown(data['region']!, _regionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      ideology: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ideology']),
      region: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}region']),
    );
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final int? ideology;
  final String? region;
  const User({required this.id, this.ideology, this.region});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || ideology != null) {
      map['ideology'] = Variable<int>(ideology);
    }
    if (!nullToAbsent || region != null) {
      map['region'] = Variable<String>(region);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      ideology: ideology == null && nullToAbsent
          ? const Value.absent()
          : Value(ideology),
      region:
          region == null && nullToAbsent ? const Value.absent() : Value(region),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      ideology: serializer.fromJson<int?>(json['ideology']),
      region: serializer.fromJson<String?>(json['region']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ideology': serializer.toJson<int?>(ideology),
      'region': serializer.toJson<String?>(region),
    };
  }

  User copyWith(
          {int? id,
          Value<int?> ideology = const Value.absent(),
          Value<String?> region = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        ideology: ideology.present ? ideology.value : this.ideology,
        region: region.present ? region.value : this.region,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('ideology: $ideology, ')
          ..write('region: $region')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ideology, region);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.ideology == this.ideology &&
          other.region == this.region);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<int?> ideology;
  final Value<String?> region;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.ideology = const Value.absent(),
    this.region = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.ideology = const Value.absent(),
    this.region = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<int>? ideology,
    Expression<String>? region,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ideology != null) 'ideology': ideology,
      if (region != null) 'region': region,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id, Value<int?>? ideology, Value<String?>? region}) {
    return UsersCompanion(
      id: id ?? this.id,
      ideology: ideology ?? this.ideology,
      region: region ?? this.region,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ideology.present) {
      map['ideology'] = Variable<int>(ideology.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('ideology: $ideology, ')
          ..write('region: $region')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final Ideologies ideologies = Ideologies(this);
  late final Users users = Users(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [ideologies, users];
}
