import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_entity_list/entity_list/model/entity.dart';
import 'package:flutter_entity_list/entity_list/model/metadata.dart';
import 'package:get/route_manager.dart';

class EntityWidget extends StatelessWidget {
  final List<EntityMetadata> metadata;
  final Entity entity;

  Map<String, List<EntityMetadata>> groupedAttributes =
      <String, List<EntityMetadata>>{};

  EntityWidget(this.metadata, this.entity);

  List<Map<int, Set<AttributesRaw>>> _prepareGroups() {
    // Сгруппируем поля по группам, отталкиваясь от атрибута groupName (праилнее, конечно от groupIndex)
    for (var item in metadata) {
      groupedAttributes
          .putIfAbsent(item.groupName, () => <EntityMetadata>[])
          .add(item);
    }
    print(groupedAttributes.toString());
  }

  @override
  Widget build(BuildContext context) {
    _prepareGroups();

    return GestureDetector(
      // по идее при тапе на карточку элемента списка д.б. переход на
      // экран подробной информации по объекту, отдельный запрос и т.д. пока просто переход на
      // пусирй экран - заглушка
      onTap: () => {Get.toNamed("/einfo", arguments: {"metadata" : metadata, "entity" : entity})},
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        color: Colors.green[100],
        shadowColor: Colors.blueGrey,
        /*shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.green, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(10))),*/
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ExpansionTile(
            title: Row(
              children: [
                Flexible(
                  child: Wrap(
                    children: [
                      /*Text(entity.attributesRaw['Entity']!=null ? entity.attributesRaw['Entity'].desc : ' ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      entity.attributesRaw['Entity']!=null ? Text(' - ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)) : Text(' '),*/
                      Text(entity.attributesRaw['ObjectName']!=null ? entity.attributesRaw['ObjectName'].desc : ' ', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            children: [
              Padding(
                padding: EdgeInsets.only(right: 12.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: groupedAttributes.length ?? 0,
                    itemBuilder: (context, index) {
                      String key = groupedAttributes.keys.elementAt(index);
                      return Column(
                        children: [
                          Text(key ?? 'Общая информация'.toString(),
                       style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemCount: groupedAttributes[key].length,
                              itemBuilder: (context, sindex) {
                                return Visibility(
                                  visible: groupedAttributes[key][sindex].visible,
                                  child: Flexible(
                                    child: Wrap(
                                      children: [
                                        Text(groupedAttributes[key][sindex].caption ??
                                            ' [] ', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold)),
                                        Text(' = ', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold)),
                                        Text(entity
                                                .attributesRaw[groupedAttributes[key]
                                                        [sindex]
                                                    .attributeName]
                                                .desc
                                                .toString() ??
                                            ' ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                          new Divider(
                            height: 2.0,
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
