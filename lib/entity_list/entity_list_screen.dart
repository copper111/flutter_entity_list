import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_entity_list/common_widgets/navigation.dart';
import 'package:flutter_entity_list/entity_list/entity_descripter.dart';
import 'package:flutter_entity_list/authentication/api/login_api.dart';
import 'package:flutter_entity_list/entity_list/entity_list_screen_controller.dart';
import 'package:flutter_entity_list/entity_list/widgets/entity_list_item_widget.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EntityListScreen extends StatelessWidget {
  LoginInfo user;

  final entityIdController = TextEditingController();
  // TODO: должно получаться путем запроса на сервер, то есть динамически, а не путем задания констант
  // TODO: но мне пока не понятно какими критериями пользоваться при отборе таких сущностей ?
  List<EntityDesripter> entityTypeList = <EntityDesripter>[
    const EntityDesripter(282, "Наряд допуск"),
    const EntityDesripter(10011, "Разрешение на подготовку"),
    const EntityDesripter(10013, "Целевой инструктаж"),
    const EntityDesripter(10012, "Допуск к работе"),
    const EntityDesripter(20000, "Оборудование")
  ];

  EntityListScreen({Key key, this.user}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<EntityListWidgetControler>(
      init: EntityListWidgetControler(),
      builder: (_) => Scaffold(
          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
          drawer: Navigation(),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cущность', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: DropdownButton<int>(
                    value: _.entityId,
                    icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                    onChanged: (int newValue) {
                      _.setEntityId(newValue);
                    },
                    underline: Container(
                      height: 2,
                      color: Colors.white54,
                    ),
                    //
                    items: entityTypeList.map((EntityDesripter value) {
                      return new DropdownMenuItem<int>(
                        value: value.id,
                        child: new Text(value.name.toString()),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
          body: CupertinoScrollbar(
            isAlwaysShown: true,
            radiusWhileDragging: Radius.circular(20.0),
            radius: Radius.circular(10.0),
            child: FutureBuilder(
                future:
                    Future.wait([_.getFutureMetadata(), _.getFutureEntities()]),
                builder: (context, ps) {
                  if (ps.connectionState == ConnectionState.done &&
                      ps.hasData) {
                    return ps.data[0] == null || ps.data[1] == null
                        ? Center(child: Text("Не обнаружено подходящих записей.", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)))
                        : ListView.builder(
                            itemCount: ps.data[1].length ?? 0,
                            padding: EdgeInsets.all(5),
                            itemBuilder: (context, index) {
                              return EntityWidget(
                                  ps.data[0], ps.data[1][index]);
                            });
                  } else
                    return Center(child: CircularProgressIndicator());
                }),
          )),
    );
  }
}
