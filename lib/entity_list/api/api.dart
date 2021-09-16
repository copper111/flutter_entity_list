import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("argus/webresources/system/inf/inventory/api/entities/{entity-id}/iuc/{iuc-keyword}/instances/list")
  Future<List<Entity>> getEntities(@Path("entity-id") int entityId, @Path("iuc-keyword") String iucKeyword,
    @Body() List<dynamic> possibleFilterStates, @Query("sorting-rules[]") List<String> sortingRules,
    @Query("first-row") int firstRow, @Query("max-rows") int maxRows );
}

@JsonSerializable()
class Entity {
  int id;
  int entityId;
  String entityName;
  Map<String, AttributesRaw> attributesRaw;


  Entity(this.id, this.entityId, this.entityName, this.attributesRaw);

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
  Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@JsonSerializable()
class AttributesRaw {
  dynamic value;
  dynamic desc;


  AttributesRaw(this.value, this.desc);

  factory AttributesRaw.fromJson(Map<String, dynamic> json) => _$AttributesRawFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesRawToJson(this);

}