import 'package:flutter_entity_list/entity_list/model/metadata.dart';
import 'package:hive/hive.dart';

class EntityMetadataApiLocal{
  Future<List<EntityMetadata>> getAllEntityMetadata(int entityId, String iuc) async {
    var box = await Hive.openBox<List<EntityMetadata>>('entity_metadata');
    return box.get(entityId).toList(growable: true);
  }

  Future<void> setAllEntityMetadata(List<EntityMetadata> metadataList, int entityId) async {
    var box = await Hive.openBox<List<EntityMetadata>>('entity_metadata');
    Map<dynamic, List<EntityMetadata>> map = {entityId : metadataList};
    box.putAll(map);
  }
}