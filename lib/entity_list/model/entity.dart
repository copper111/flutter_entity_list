import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Entity {
  @HiveField(0)
  dynamic id;
  @HiveField(1)
  dynamic entityId;
  @HiveField(2)
  dynamic entityName;
  @HiveField(3)
  Map<dynamic, AttributesRaw> attributesRaw;


  Entity(this.id, this.entityId, this.entityName, this.attributesRaw);

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
  Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class AttributesRaw {
  @HiveField(0)
  dynamic value;
  @HiveField(1)
  dynamic desc;


  AttributesRaw(this.value, this.desc);

  factory AttributesRaw.fromJson(Map<String, dynamic> json) => _$AttributesRawFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesRawToJson(this);

}