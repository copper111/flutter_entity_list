import 'package:flutter/material.dart';
import 'package:flutter_entity_list/authentication/authentication_controller.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationController _authenticationController = Get.find();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Аргус',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/logo.png'))),
          ),

          ListTile(
            leading: Icon(Icons.list, color: Colors.white),
            title: Text('Список сущностей', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            onTap: () {
              Get.toNamed("/");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Настройки', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            onTap: () {
              Get.toNamed("/settings");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text('Выход', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            onTap: () {
              _authenticationController.signOut();
            },
          ),
        ],
      ),
    );
  }
}