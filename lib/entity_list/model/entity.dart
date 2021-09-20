import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Entity {
  @HiveField(0)
  int id;
  @HiveField(1)
  int entityId;
  @HiveField(2)
  String entityName;
  @HiveField(3)
  Map<String, AttributesRaw> attributesRaw;


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