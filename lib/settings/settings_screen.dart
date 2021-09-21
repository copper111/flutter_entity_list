import 'package:flutter/material.dart';
import 'package:flutter_entity_list/common_widgets/navigation.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navigation(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        title: Text('Экран настроек'),
      ),
      body: Center(child: Text('Андер констракшен')),
    );
  }
}