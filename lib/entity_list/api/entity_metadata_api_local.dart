import 'package:flutter_entity_list/entity_list/model/metadata.dart';
import 'package:hive/hive.dart';

class EntityMetadataApiLocal{
  Future<List<EntityMetadata>> getAllEntityMetadata(int entityId, String iuc) async {
    var box = await Hive.openBox<EntityMetadata>('entity_metadata');
    return box.values.toList(growable: true).toList();
  }

  Future<void> setAllEntityMetadata(List<EntityMetadata> metadataList) async {
    var box = await Hive.openBox<EntityMetadata>('entity_metadata');
    Map<dynamic, EntityMetadata> map = Map.fromIterable(metadataList, key: (m) => m.attributeName, value: (m) => m);
    box.putAll(map);
  }
}