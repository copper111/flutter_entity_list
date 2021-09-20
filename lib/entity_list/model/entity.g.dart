// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntityAdapter extends TypeAdapter<Entity> {
  @override
  final int typeId = 1;

  @override
  Entity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Entity(
      fields[0] as int,
      fields[1] as int,
      fields[2] as String,
      (fields[3] as Map)?.cast<String, AttributesRaw>(),
    );
  }

  @override
  void write(BinaryWriter writer, Entity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.entityId)
      ..writeByte(2)
      ..write(obj.entityName)
      ..writeByte(3)
      ..write(obj.attributesRaw);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttributesRawAdapter extends TypeAdapter<AttributesRaw> {
  @override
  final int typeId = 2;

  @override
  AttributesRaw read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttributesRaw(
      fields[0] as dynamic,
      fields[1] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, AttributesRaw obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.desc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttributesRawAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return Entity(
    json['id'] as int,
    json['entityId'] as int,
    json['entityName'] as String,
    (json['attributesRaw'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : AttributesRaw.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'id': instance.id,
      'entityId': instance.entityId,
      'entityName': instance.entityName,
      'attributesRaw': instance.attributesRaw,
    };

AttributesRaw _$AttributesRawFromJson(Map<String, dynamic> json) {
  return AttributesRaw(
    json['value'],
    json['desc'],
  );
}

Map<String, dynamic> _$AttributesRawToJson(AttributesRaw instance) =>
    <String, dynamic>{
      'value': instance.value,
      'desc': instance.desc,
    };
