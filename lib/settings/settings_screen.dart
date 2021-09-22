import 'package:flutter/material.dart';
import 'package:flutter_entity_list/common_widgets/navigation.dart';
import 'package:flutter_entity_list/settings/settings_screen_controller.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Navigation(),
        appBar: AppBar(
          title: Text('Экран настроек'),
        ),
        body: GetBuilder<SettingsScreenController>(
          init: SettingsScreenController(),
          builder: (_) => Column(
            children: [
              Row(
                children: [
                  Text("Выбор темной темы"),
                  Center(
                    child: Container(
                      child: Switch(
                        value: _.isSwitched,
                        onChanged: (value) {
                          _.changeTheme(value) ;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
