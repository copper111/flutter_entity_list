import 'package:flutter_entity_list/entity_list/api/entity_metadata_api_remote.dart';
import 'package:flutter_entity_list/entity_list/entity_list_repository.dart';
import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:flutter_entity_list/entity_list/model/metadata.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

class EntityListWidgetControler extends GetxController{
  final logger = Logger();
  final metadata = Future.value(<EntityMetadata>[]).obs;
  final entities = Future.value(<Entity>[]).obs;
  int entityId;

  // Получим репозиторий
  final EntityListRepository _entityListRepository = Get.find();

  @override
  void onInit(){
    super.onInit();
  }

  Future<List<EntityMetadata>> getFutureMetadata() async{
    metadata.value = _entityListRepository.getEntityMetadataList(entityId, "List").catchError((Object obj) {
      logger.e("Got error : $obj.printError()");
      return null;
    });
    return metadata.value;
  }

  Future<List<Entity>> getFutureEntities() async{
    entities.value = _entityListRepository.getEntities(entityId, "List", [], [], 0, 1000).catchError((Object obj) {
      logger.e("Got error : $obj.printError()");
      return null;
    });
    return  entities.value;
  }

  // при смене ID сущности в фильтре перетянем метаданные и сами экземпляры сущностей
  // обновим соответствующие виджеты
  void setEntityId(int newValue) {
    entityId = newValue;
    metadata.value = getFutureMetadata();
    entities.value = getFutureEntities();
    update();
  }
}