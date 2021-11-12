import 'package:flutter/material.dart';
import 'package:flutter_entity_list/authentication/authentication_controller.dart';
import 'package:flutter_entity_list/authentication/authentication_state.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthenticationController _authenticationController = Get.find();

    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Аргус',
                    style: TextStyle(fontSize: 25),
                  ),
                  _authenticationController.state is Authenticated
                      ? Text(
                          "${(_authenticationController.state as Authenticated).user.loginName}")
                      : Text("")
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/logo.png'))),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Список сущностей',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Get.toNamed("/");
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Настройки',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Get.toNamed("/settings");
              },
            ),
            ListTile(
              leading: Icon(Icons.wallet_travel_rounded),
              title:
              Text('МАРМ', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                Get.toNamed("/marm");
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title:
                  Text('Выход', style: TextStyle(fontWeight: FontWeight.bold)),
              onTap: () {
                _authenticationController.signOut();
                Get.toNamed("/");
              },
            ),

          ],
        ),
      ),
    );
  }
}
