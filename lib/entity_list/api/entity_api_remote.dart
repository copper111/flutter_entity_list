import 'package:dio/dio.dart';
import 'package:flutter_entity_list/authentication/authentication_controller.dart';
import 'package:flutter_entity_list/authentication/authentication_state.dart';
import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';

part 'entity_api_remote.g.dart';

@RestApi()
abstract class EntityApiRemote {
  factory EntityApiRemote(Dio dio, {String baseUrl}) = _EntityApiRemote;

  @POST("argus/webresources/system/inf/inventory/api/entities/{entity-id}/iuc/{iuc-keyword}/instances/list")
  Future<List<Entity>> getEntities(@Path("entity-id") int entityId, @Path("iuc-keyword") String iucKeyword,
    @Body() List<dynamic> possibleFilterStates, @Query("sorting-rules[]") List<String> sortingRules,
    @Query("first-row") int firstRow, @Query("max-rows") int maxRows );
}

class EntityClientRemote{
  static EntityApiRemote prepareClient(){
    final AuthenticationController _authenticationController = Get.find();
    return EntityApiRemote((_authenticationController.state as Authenticated).connection);
  }
}