import 'package:flutter_entity_list/entity_list/api/entity_api_remote.dart';
import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:get/get.dart';

import 'api/entity_api_local.dart';
import 'api/entity_metadata_api_local.dart';
import 'api/entity_metadata_api_remote.dart';
import 'model/metadata.dart';

/// Репозиторий для работы с сущностями и метаданными этих сущностей для фичи EntityList
class EntityListRepository /*extends GetxService*/{

  // Datasources
  final EntityApiRemote entityRestClient = EntityClientRemote.prepareClient();
  final EntityApiLocal entityLocalStorage = EntityApiLocal();
  final EntityMetadataApiRemote  metadataRestClient = EntityMetadataClientRemote.prepareClient();
  final EntityMetadataApiLocal metadataLocalStorage = EntityMetadataApiLocal();

  /// Получает список экземпляров определенной сущности
  Future<List<Entity>> getEntities(int entityId, String iucKeyword, List possibleFilterStates,
      List<String> sortingRules, int firstRow, int maxRows) async{
    try {
      var result = await entityRestClient.getEntities(
          entityId, iucKeyword, possibleFilterStates, sortingRules, firstRow,
          maxRows);
      entityLocalStorage.setEntities(result, entityId);
    } catch(e){
      //print(e.message);
      Get.snackbar("Ошибка", "Ошибка при загрузке сущностей: $e.message", duration: const Duration(minutes: 1));
    }
    var localResult = await entityLocalStorage.getEntities(entityId, iucKeyword, possibleFilterStates, sortingRules, firstRow, maxRows);
    return localResult;
  }

  Future<List<EntityMetadata>> getEntityMetadataList(int entityId, String iuk) async{
    try {
      var result = await metadataRestClient.getEntityMetadata(entityId, iuk);
      metadataLocalStorage.setAllEntityMetadata(result, entityId);
    } catch(e){
      //print(e.message);
      Get.snackbar("Ошибка", "Ошибка при загрузке метаданных: $e.message", duration: const Duration(minutes: 1));
    }
    var localResult = await metadataLocalStorage.getAllEntityMetadata(entityId, iuk);
    return localResult;
  }
}