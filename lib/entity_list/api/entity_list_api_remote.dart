import 'package:flutter_entity_list/authentication/authentication_controller.dart';
import 'package:flutter_entity_list/authentication/authentication_state.dart';
import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'entity_list_api_remote.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("argus/webresources/system/inf/inventory/api/entities/{entity-id}/iuc/{iuc-keyword}/instances/list")
  Future<List<Entity>> getEntities(@Path("entity-id") int entityId, @Path("iuc-keyword") String iucKeyword,
    @Body() List<dynamic> possibleFilterStates, @Query("sorting-rules[]") List<String> sortingRules,
    @Query("first-row") int firstRow, @Query("max-rows") int maxRows );
}

class EntityListRemoteClient{
  static RestClient prepareClient(){
    final AuthenticationController _authenticationController = Get.find();
    return RestClient((_authenticationController.state as Authenticated).connection);
  }
}