import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:hive/hive.dart';

class EntityApiLocal{

  Future<List<Entity>> getEntities(int entityId, String iucKeyword, List possibleFilterStates, List<String> sortingRules, int firstRow, int maxRows) async {
    var box = await Hive.openBox<Entity>('entity');
    // пример сортированного и фильтрованного запроса
    //return box.values.toList(growable: true).where((entity) => entity.attributesRaw["ObjectName"].desc.contains("Схема_кусок_чего-то")).toList();
    return box.values.toList(growable: true).where((entity) => entity.entityId == entityId).toList();
  }

  Future<void> setEntities(List<Entity> entities) async {
    var box = await Hive.openBox<Entity>('entity');
    Map<dynamic, Entity> map = Map.fromIterable(entities, key: (e) => e.id, value: (e) => e);
    box.putAll(map);
  }
}