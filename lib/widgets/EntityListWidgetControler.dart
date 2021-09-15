import 'package:flutter_entity_list/rest-api/api.dart';
import 'package:flutter_entity_list/rest-api/metadata.dart';
import 'package:flutter_entity_list/services/ApiService.dart';
import 'package:flutter_entity_list/services/MetadataService.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';

class EntityListWidgetControler extends GetxController{
  final logger = Logger();
  final metadata = Future.value(<EntityMetadata>[]).obs;
  final entities = Future.value(<Entity>[]).obs;
  int entityId;

  @override
  void onInit(){
    super.onInit();
  }

  Future<List<EntityMetadata>> getFutureMetadata() async{
    metadata.value = MetadataService().prepareClient().getEntityMetadata(entityId, "List").catchError((Object obj) {
      logger.e("Got error : $obj.printError()");
    });
    return metadata.value;
  }

  Future<List<Entity>> getFutureEntities() async{
    entities.value = ApiService().prepareClient().getEntities(entityId, "List", [], [], 0, 1000).catchError((Object obj) {
      logger.e("Got error : $obj.printError()");
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