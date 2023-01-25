// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
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
  late final GeneratedColumn<String> ideology = GeneratedColumn<String>(
      'ideology', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _regionMeta = const VerificationMeta('region');
  late final GeneratedColumn<String> region = GeneratedColumn<String>(
      'region', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _politicalcompassMeta =
      const VerificationMeta('politicalcompass');
  late final GeneratedColumn<String> politicalcompass = GeneratedColumn<String>(
      'politicalcompass', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _sapplyvaluesMeta =
      const VerificationMeta('sapplyvalues');
  late final GeneratedColumn<String> sapplyvalues = GeneratedColumn<String>(
      'sapplyvalues', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _dozenvaluesMeta =
      const VerificationMeta('dozenvalues');
  late final GeneratedColumn<String> dozenvalues = GeneratedColumn<String>(
      'dozenvalues', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _econvaluesMeta =
      const VerificationMeta('econvalues');
  late final GeneratedColumn<String> econvalues = GeneratedColumn<String>(
      'econvalues', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _eightvaluesMeta =
      const VerificationMeta('eightvalues');
  late final GeneratedColumn<String> eightvalues = GeneratedColumn<String>(
      'eightvalues', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _culturalvaluesMeta =
      const VerificationMeta('culturalvalues');
  late final GeneratedColumn<String> culturalvalues = GeneratedColumn<String>(
      'culturalvalues', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [
        id,
        ideology,
        region,
        politicalcompass,
        sapplyvalues,
        dozenvalues,
        econvalues,
        eightvalues,
        culturalvalues
      ];
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
    if (data.containsKey('politicalcompass')) {
      context.handle(
          _politicalcompassMeta,
          politicalcompass.isAcceptableOrUnknown(
              data['politicalcompass']!, _politicalcompassMeta));
    }
    if (data.containsKey('sapplyvalues')) {
      context.handle(
          _sapplyvaluesMeta,
          sapplyvalues.isAcceptableOrUnknown(
              data['sapplyvalues']!, _sapplyvaluesMeta));
    }
    if (data.containsKey('dozenvalues')) {
      context.handle(
          _dozenvaluesMeta,
          dozenvalues.isAcceptableOrUnknown(
              data['dozenvalues']!, _dozenvaluesMeta));
    }
    if (data.containsKey('econvalues')) {
      context.handle(
          _econvaluesMeta,
          econvalues.isAcceptableOrUnknown(
              data['econvalues']!, _econvaluesMeta));
    }
    if (data.containsKey('eightvalues')) {
      context.handle(
          _eightvaluesMeta,
          eightvalues.isAcceptableOrUnknown(
              data['eightvalues']!, _eightvaluesMeta));
    }
    if (data.containsKey('culturalvalues')) {
      context.handle(
          _culturalvaluesMeta,
          culturalvalues.isAcceptableOrUnknown(
              data['culturalvalues']!, _culturalvaluesMeta));
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
          .read(DriftSqlType.string, data['${effectivePrefix}ideology']),
      region: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}region']),
      politicalcompass: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}politicalcompass']),
      sapplyvalues: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sapplyvalues']),
      dozenvalues: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dozenvalues']),
      econvalues: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}econvalues']),
      eightvalues: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}eightvalues']),
      culturalvalues: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}culturalvalues']),
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
  final String? ideology;
  final String? region;
  final String? politicalcompass;
  final String? sapplyvalues;
  final String? dozenvalues;
  final String? econvalues;
  final String? eightvalues;
  final String? culturalvalues;
  const User(
      {required this.id,
      this.ideology,
      this.region,
      this.politicalcompass,
      this.sapplyvalues,
      this.dozenvalues,
      this.econvalues,
      this.eightvalues,
      this.culturalvalues});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || ideology != null) {
      map['ideology'] = Variable<String>(ideology);
    }
    if (!nullToAbsent || region != null) {
      map['region'] = Variable<String>(region);
    }
    if (!nullToAbsent || politicalcompass != null) {
      map['politicalcompass'] = Variable<String>(politicalcompass);
    }
    if (!nullToAbsent || sapplyvalues != null) {
      map['sapplyvalues'] = Variable<String>(sapplyvalues);
    }
    if (!nullToAbsent || dozenvalues != null) {
      map['dozenvalues'] = Variable<String>(dozenvalues);
    }
    if (!nullToAbsent || econvalues != null) {
      map['econvalues'] = Variable<String>(econvalues);
    }
    if (!nullToAbsent || eightvalues != null) {
      map['eightvalues'] = Variable<String>(eightvalues);
    }
    if (!nullToAbsent || culturalvalues != null) {
      map['culturalvalues'] = Variable<String>(culturalvalues);
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
      politicalcompass: politicalcompass == null && nullToAbsent
          ? const Value.absent()
          : Value(politicalcompass),
      sapplyvalues: sapplyvalues == null && nullToAbsent
          ? const Value.absent()
          : Value(sapplyvalues),
      dozenvalues: dozenvalues == null && nullToAbsent
          ? const Value.absent()
          : Value(dozenvalues),
      econvalues: econvalues == null && nullToAbsent
          ? const Value.absent()
          : Value(econvalues),
      eightvalues: eightvalues == null && nullToAbsent
          ? const Value.absent()
          : Value(eightvalues),
      culturalvalues: culturalvalues == null && nullToAbsent
          ? const Value.absent()
          : Value(culturalvalues),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      ideology: serializer.fromJson<String?>(json['ideology']),
      region: serializer.fromJson<String?>(json['region']),
      politicalcompass: serializer.fromJson<String?>(json['politicalcompass']),
      sapplyvalues: serializer.fromJson<String?>(json['sapplyvalues']),
      dozenvalues: serializer.fromJson<String?>(json['dozenvalues']),
      econvalues: serializer.fromJson<String?>(json['econvalues']),
      eightvalues: serializer.fromJson<String?>(json['eightvalues']),
      culturalvalues: serializer.fromJson<String?>(json['culturalvalues']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'ideology': serializer.toJson<String?>(ideology),
      'region': serializer.toJson<String?>(region),
      'politicalcompass': serializer.toJson<String?>(politicalcompass),
      'sapplyvalues': serializer.toJson<String?>(sapplyvalues),
      'dozenvalues': serializer.toJson<String?>(dozenvalues),
      'econvalues': serializer.toJson<String?>(econvalues),
      'eightvalues': serializer.toJson<String?>(eightvalues),
      'culturalvalues': serializer.toJson<String?>(culturalvalues),
    };
  }

  User copyWith(
          {int? id,
          Value<String?> ideology = const Value.absent(),
          Value<String?> region = const Value.absent(),
          Value<String?> politicalcompass = const Value.absent(),
          Value<String?> sapplyvalues = const Value.absent(),
          Value<String?> dozenvalues = const Value.absent(),
          Value<String?> econvalues = const Value.absent(),
          Value<String?> eightvalues = const Value.absent(),
          Value<String?> culturalvalues = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        ideology: ideology.present ? ideology.value : this.ideology,
        region: region.present ? region.value : this.region,
        politicalcompass: politicalcompass.present
            ? politicalcompass.value
            : this.politicalcompass,
        sapplyvalues:
            sapplyvalues.present ? sapplyvalues.value : this.sapplyvalues,
        dozenvalues: dozenvalues.present ? dozenvalues.value : this.dozenvalues,
        econvalues: econvalues.present ? econvalues.value : this.econvalues,
        eightvalues: eightvalues.present ? eightvalues.value : this.eightvalues,
        culturalvalues:
            culturalvalues.present ? culturalvalues.value : this.culturalvalues,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('ideology: $ideology, ')
          ..write('region: $region, ')
          ..write('politicalcompass: $politicalcompass, ')
          ..write('sapplyvalues: $sapplyvalues, ')
          ..write('dozenvalues: $dozenvalues, ')
          ..write('econvalues: $econvalues, ')
          ..write('eightvalues: $eightvalues, ')
          ..write('culturalvalues: $culturalvalues')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ideology, region, politicalcompass,
      sapplyvalues, dozenvalues, econvalues, eightvalues, culturalvalues);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.ideology == this.ideology &&
          other.region == this.region &&
          other.politicalcompass == this.politicalcompass &&
          other.sapplyvalues == this.sapplyvalues &&
          other.dozenvalues == this.dozenvalues &&
          other.econvalues == this.econvalues &&
          other.eightvalues == this.eightvalues &&
          other.culturalvalues == this.culturalvalues);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String?> ideology;
  final Value<String?> region;
  final Value<String?> politicalcompass;
  final Value<String?> sapplyvalues;
  final Value<String?> dozenvalues;
  final Value<String?> econvalues;
  final Value<String?> eightvalues;
  final Value<String?> culturalvalues;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.ideology = const Value.absent(),
    this.region = const Value.absent(),
    this.politicalcompass = const Value.absent(),
    this.sapplyvalues = const Value.absent(),
    this.dozenvalues = const Value.absent(),
    this.econvalues = const Value.absent(),
    this.eightvalues = const Value.absent(),
    this.culturalvalues = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    this.ideology = const Value.absent(),
    this.region = const Value.absent(),
    this.politicalcompass = const Value.absent(),
    this.sapplyvalues = const Value.absent(),
    this.dozenvalues = const Value.absent(),
    this.econvalues = const Value.absent(),
    this.eightvalues = const Value.absent(),
    this.culturalvalues = const Value.absent(),
  });
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? ideology,
    Expression<String>? region,
    Expression<String>? politicalcompass,
    Expression<String>? sapplyvalues,
    Expression<String>? dozenvalues,
    Expression<String>? econvalues,
    Expression<String>? eightvalues,
    Expression<String>? culturalvalues,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ideology != null) 'ideology': ideology,
      if (region != null) 'region': region,
      if (politicalcompass != null) 'politicalcompass': politicalcompass,
      if (sapplyvalues != null) 'sapplyvalues': sapplyvalues,
      if (dozenvalues != null) 'dozenvalues': dozenvalues,
      if (econvalues != null) 'econvalues': econvalues,
      if (eightvalues != null) 'eightvalues': eightvalues,
      if (culturalvalues != null) 'culturalvalues': culturalvalues,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String?>? ideology,
      Value<String?>? region,
      Value<String?>? politicalcompass,
      Value<String?>? sapplyvalues,
      Value<String?>? dozenvalues,
      Value<String?>? econvalues,
      Value<String?>? eightvalues,
      Value<String?>? culturalvalues}) {
    return UsersCompanion(
      id: id ?? this.id,
      ideology: ideology ?? this.ideology,
      region: region ?? this.region,
      politicalcompass: politicalcompass ?? this.politicalcompass,
      sapplyvalues: sapplyvalues ?? this.sapplyvalues,
      dozenvalues: dozenvalues ?? this.dozenvalues,
      econvalues: econvalues ?? this.econvalues,
      eightvalues: eightvalues ?? this.eightvalues,
      culturalvalues: culturalvalues ?? this.culturalvalues,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (ideology.present) {
      map['ideology'] = Variable<String>(ideology.value);
    }
    if (region.present) {
      map['region'] = Variable<String>(region.value);
    }
    if (politicalcompass.present) {
      map['politicalcompass'] = Variable<String>(politicalcompass.value);
    }
    if (sapplyvalues.present) {
      map['sapplyvalues'] = Variable<String>(sapplyvalues.value);
    }
    if (dozenvalues.present) {
      map['dozenvalues'] = Variable<String>(dozenvalues.value);
    }
    if (econvalues.present) {
      map['econvalues'] = Variable<String>(econvalues.value);
    }
    if (eightvalues.present) {
      map['eightvalues'] = Variable<String>(eightvalues.value);
    }
    if (culturalvalues.present) {
      map['culturalvalues'] = Variable<String>(culturalvalues.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('ideology: $ideology, ')
          ..write('region: $region, ')
          ..write('politicalcompass: $politicalcompass, ')
          ..write('sapplyvalues: $sapplyvalues, ')
          ..write('dozenvalues: $dozenvalues, ')
          ..write('econvalues: $econvalues, ')
          ..write('eightvalues: $eightvalues, ')
          ..write('culturalvalues: $culturalvalues')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final Users users = Users(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}
