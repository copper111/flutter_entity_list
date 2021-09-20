import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:hive/hive.dart';

class EntityListApiLocal{

  Future<List<Entity>> getEntities(int entityId, String iucKeyword, List possibleFilterStates, List<String> sortingRules, int firstRow, int maxRows) async {
    var box = await Hive.openBox('entity');
    return box.values as Future<List<Entity>>;
  }

  Future<void> setEntities(List<Entity> entities) async {
    var box = await Hive.openBox('entity');
    box.addAll(entities);
    print(box.getAt(0).toString());
  }
}