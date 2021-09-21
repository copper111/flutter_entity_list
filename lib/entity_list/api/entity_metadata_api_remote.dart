import 'package:dio/dio.dart';
import 'package:flutter_entity_list/authentication/authentication_controller.dart';
import 'package:flutter_entity_list/authentication/authentication_state.dart';
import 'package:flutter_entity_list/entity_list/model/metadata.dart';
import 'package:get/get.dart';
import 'package:retrofit/retrofit.dart';

part 'entity_metadata_api_remote.g.dart';

@RestApi()
abstract class EntityMetadataApiRemote {
  factory EntityMetadataApiRemote(Dio dio, {String baseUrl}) = _EntityMetadataApiRemote;

  @GET("argus/webresources/system/inf/inventory/metadata/entities/{entity-id}/iuc/{iuc-keyword}/custom-values?fetch-possible-values=false")
  Future<List<EntityMetadata>> getEntityMetadata(@Path("entity-id") int entityId, @Path("iuc-keyword") String iuk);
}

class EntityMetadataClientRemote{
  static EntityMetadataApiRemote prepareClient(){
    final AuthenticationController _authenticationController = Get.find();
    return EntityMetadataApiRemote((_authenticationController.state as Authenticated).connection);
  }
}