import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:hive/hive.dart';

class EntityApiLocal{

  Future<List<Entity>> getEntities(int entityId, String iucKeyword, List possibleFilterStates, List<String> sortingRules, int firstRow, int maxRows) async {
    var box = await Hive.openBox<List<Entity>>('entity');
    // пример сортированного и фильтрованного запроса
    //return box.values.toList(growable: true).where((entity) => entity.attributesRaw["ObjectName"].desc.contains("Схема_кусок_чего-то")).toList();
    return box.get(entityId)!.toList(growable: true);
  }

  Future<void> setEntities(List<Entity> entities, int entityId) async {
    var box = await Hive.openBox<List<Entity>>('entity');
    Map<dynamic, List<Entity>> map = {entityId : entities};
    box.putAll(map);
  }
}