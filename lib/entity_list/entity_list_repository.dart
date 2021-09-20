import 'package:flutter_entity_list/entity_list/api/entity_list_api_remote.dart';
import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:get/get.dart';

import 'api/entity_list_api_local.dart';


class EntityListRepository extends GetxService{

  // remoteDatasource
  final RestClient restClient = EntityListRemoteClient.prepareClient();
  final EntityListApiLocal localStorage = EntityListApiLocal();

  @override
  Future<List<Entity>> getEntities(int entityId, String iucKeyword, List possibleFilterStates, List<String> sortingRules, int firstRow, int maxRows) async{
    List<Entity> remoteResult = await restClient.getEntities(entityId, iucKeyword, possibleFilterStates, sortingRules, firstRow, maxRows);
    localStorage.setEntities(remoteResult);

    var localResult = localStorage.getEntities(entityId, iucKeyword, possibleFilterStates, sortingRules, firstRow, maxRows);
    return localResult;
  }
}