import 'package:flutter/material.dart';
import 'package:flutter_entity_list/common_widgets/navigation.dart';
import 'package:flutter_entity_list/entity_list/api/api.dart';
import 'package:flutter_entity_list/entity_list/api/metadata.dart';
import 'package:get/get.dart';


class EntityInfoScreen extends StatelessWidget {

  List<EntityMetadata> metadata = Get.arguments['metadata'];
  Entity entity = Get.arguments['entity'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navigation(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          title: Text('EntityInfo id = ' + entity.id.toString()),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView.builder(
                itemCount: entity.attributesRaw.entries.length,
                itemBuilder: (context, sindex) {
                  return Wrap(
                    children: [Text(entity.attributesRaw.entries.elementAt(sindex).key, style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold)),
                               Text(' = ', style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold)),
                               Text(entity.attributesRaw.entries.elementAt(sindex).value.desc ?? ' ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ]
                  );
                }
            ),
          ),
        )
    );
  }


}