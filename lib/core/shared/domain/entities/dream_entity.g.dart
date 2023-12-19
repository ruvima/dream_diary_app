// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dream_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDreamEntityCollection on Isar {
  IsarCollection<DreamEntity> get dreamEntitys => this.collection();
}

const DreamEntitySchema = CollectionSchema(
  name: r'DreamEntity',
  id: -4837008703268811349,
  properties: {
    r'clarity': PropertySchema(
      id: 0,
      name: r'clarity',
      type: IsarType.double,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'dreamTypes': PropertySchema(
      id: 3,
      name: r'dreamTypes',
      type: IsarType.stringList,
    ),
    r'emotions': PropertySchema(
      id: 4,
      name: r'emotions',
      type: IsarType.stringList,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.string,
    ),
    r'people': PropertySchema(
      id: 6,
      name: r'people',
      type: IsarType.stringList,
    ),
    r'tags': PropertySchema(
      id: 7,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 8,
      name: r'title',
      type: IsarType.string,
    )
  },
  estimateSize: _dreamEntityEstimateSize,
  serialize: _dreamEntitySerialize,
  deserialize: _dreamEntityDeserialize,
  deserializeProp: _dreamEntityDeserializeProp,
  idName: r'irarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dreamEntityGetId,
  getLinks: _dreamEntityGetLinks,
  attach: _dreamEntityAttach,
  version: '3.1.0+1',
);

int _dreamEntityEstimateSize(
  DreamEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.dreamTypes.length * 3;
  {
    for (var i = 0; i < object.dreamTypes.length; i++) {
      final value = object.dreamTypes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.emotions.length * 3;
  {
    for (var i = 0; i < object.emotions.length; i++) {
      final value = object.emotions[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.people.length * 3;
  {
    for (var i = 0; i < object.people.length; i++) {
      final value = object.people[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  return bytesCount;
}

void _dreamEntitySerialize(
  DreamEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.clarity);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeString(offsets[2], object.description);
  writer.writeStringList(offsets[3], object.dreamTypes);
  writer.writeStringList(offsets[4], object.emotions);
  writer.writeString(offsets[5], object.id);
  writer.writeStringList(offsets[6], object.people);
  writer.writeStringList(offsets[7], object.tags);
  writer.writeString(offsets[8], object.title);
}

DreamEntity _dreamEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DreamEntity(
    clarity: reader.readDouble(offsets[0]),
    date: reader.readDateTime(offsets[1]),
    description: reader.readString(offsets[2]),
    dreamTypes: reader.readStringList(offsets[3]) ?? [],
    emotions: reader.readStringList(offsets[4]) ?? [],
    id: reader.readString(offsets[5]),
    people: reader.readStringList(offsets[6]) ?? [],
    tags: reader.readStringList(offsets[7]) ?? [],
    title: reader.readString(offsets[8]),
  );
  object.irarId = id;
  return object;
}

P _dreamEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset) ?? []) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readStringList(offset) ?? []) as P;
    case 8:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dreamEntityGetId(DreamEntity object) {
  return object.irarId ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _dreamEntityGetLinks(DreamEntity object) {
  return [];
}

void _dreamEntityAttach(
    IsarCollection<dynamic> col, Id id, DreamEntity object) {
  object.irarId = id;
}

extension DreamEntityQueryWhereSort
    on QueryBuilder<DreamEntity, DreamEntity, QWhere> {
  QueryBuilder<DreamEntity, DreamEntity, QAfterWhere> anyIrarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DreamEntityQueryWhere
    on QueryBuilder<DreamEntity, DreamEntity, QWhereClause> {
  QueryBuilder<DreamEntity, DreamEntity, QAfterWhereClause> irarIdEqualTo(
      Id irarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: irarId,
        upper: irarId,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterWhereClause> irarIdNotEqualTo(
      Id irarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: irarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: irarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: irarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: irarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterWhereClause> irarIdGreaterThan(
      Id irarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: irarId, includeLower: include),
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterWhereClause> irarIdLessThan(
      Id irarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: irarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterWhereClause> irarIdBetween(
    Id lowerIrarId,
    Id upperIrarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIrarId,
        includeLower: includeLower,
        upper: upperIrarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DreamEntityQueryFilter
    on QueryBuilder<DreamEntity, DreamEntity, QFilterCondition> {
  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> clarityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clarity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      clarityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clarity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> clarityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clarity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> clarityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clarity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dreamTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dreamTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dreamTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dreamTypes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dreamTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dreamTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dreamTypes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dreamTypes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dreamTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dreamTypes',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dreamTypes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dreamTypes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dreamTypes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dreamTypes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dreamTypes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      dreamTypesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dreamTypes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'emotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'emotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'emotions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'emotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'emotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'emotions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'emotions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'emotions',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'emotions',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'emotions',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'emotions',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'emotions',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'emotions',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'emotions',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      emotionsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'emotions',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> irarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'irarId',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      irarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'irarId',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> irarIdEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'irarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      irarIdGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'irarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> irarIdLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'irarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> irarIdBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'irarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'people',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'people',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'people',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'people',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'people',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'people',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'people',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'people',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'people',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'people',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'people',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'people',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'people',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'people',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'people',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      peopleLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'people',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }
}

extension DreamEntityQueryObject
    on QueryBuilder<DreamEntity, DreamEntity, QFilterCondition> {}

extension DreamEntityQueryLinks
    on QueryBuilder<DreamEntity, DreamEntity, QFilterCondition> {}

extension DreamEntityQuerySortBy
    on QueryBuilder<DreamEntity, DreamEntity, QSortBy> {
  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortByClarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clarity', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortByClarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clarity', Sort.desc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension DreamEntityQuerySortThenBy
    on QueryBuilder<DreamEntity, DreamEntity, QSortThenBy> {
  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByClarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clarity', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByClarityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clarity', Sort.desc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByIrarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'irarId', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByIrarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'irarId', Sort.desc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }
}

extension DreamEntityQueryWhereDistinct
    on QueryBuilder<DreamEntity, DreamEntity, QDistinct> {
  QueryBuilder<DreamEntity, DreamEntity, QDistinct> distinctByClarity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clarity');
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QDistinct> distinctByDreamTypes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dreamTypes');
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QDistinct> distinctByEmotions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'emotions');
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QDistinct> distinctByPeople() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'people');
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<DreamEntity, DreamEntity, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }
}

extension DreamEntityQueryProperty
    on QueryBuilder<DreamEntity, DreamEntity, QQueryProperty> {
  QueryBuilder<DreamEntity, int, QQueryOperations> irarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'irarId');
    });
  }

  QueryBuilder<DreamEntity, double, QQueryOperations> clarityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clarity');
    });
  }

  QueryBuilder<DreamEntity, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DreamEntity, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DreamEntity, List<String>, QQueryOperations>
      dreamTypesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dreamTypes');
    });
  }

  QueryBuilder<DreamEntity, List<String>, QQueryOperations> emotionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'emotions');
    });
  }

  QueryBuilder<DreamEntity, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DreamEntity, List<String>, QQueryOperations> peopleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'people');
    });
  }

  QueryBuilder<DreamEntity, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<DreamEntity, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }
}
