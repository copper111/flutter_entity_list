import 'package:flutter_entity_list/entity_list/api/entity_api_remote.dart';
import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:get/get.dart';

import 'api/entity_api_local.dart';
import 'api/entity_metadata_api_local.dart';
import 'api/entity_metadata_api_remote.dart';
import 'model/metadata.dart';

/// Репозиторий для работы с сущностями и метаданными этих сущностей для фичи EntityList
class EntityListRepository extends GetxService{

  // Datasources
  final EntityApiRemote entityRestClient = EntityClientRemote.prepareClient();
  final EntityApiLocal entityLocalStorage = EntityApiLocal();
  final EntityMetadataApiRemote  metadataRestClient = EntityMetadataClientRemote.prepareClient();
  final EntityMetadataApiLocal metadataLocalStorage = EntityMetadataApiLocal();

  /// Получает список экземпляров определенной сущности
  Future<List<Entity>> getEntities(int entityId, String iucKeyword, List possibleFilterStates, List<String> sortingRules, int firstRow, int maxRows) async{
    /*List<Entity> remoteResult = await entityRestClient.getEntities(entityId, iucKeyword, possibleFilterStates, sortingRules, firstRow, maxRows);
    entityLocalStorage.setEntities(remoteResult);

    var localResult = entityLocalStorage.getEntities(entityId, iucKeyword, possibleFilterStates, sortingRules, firstRow, maxRows);
    return localResult;*/

    entityRestClient.getEntities(entityId, iucKeyword, possibleFilterStates, sortingRules, firstRow, maxRows).then((value) =>
    {
      entityLocalStorage.setEntities(value),
    }).onError((error, stackTrace) => {

    });


    var localResult = entityLocalStorage.getEntities(entityId, iucKeyword, possibleFilterStates, sortingRules, firstRow, maxRows);
    return localResult;
  }

  Future<List<EntityMetadata>> getEntityMetadataList(int entityId, String iuk) async{
    metadataRestClient.getEntityMetadata(entityId, iuk).then((value) => {
      metadataLocalStorage.setAllEntityMetadata(value),
    }).onError((error, stackTrace) => {

    });

    var localResult = metadataLocalStorage.getAllEntityMetadata(entityId, iuk);
    return localResult;
  }


}