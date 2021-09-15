import 'package:flutter/material.dart';
import 'package:flutter_entity_list/screens/EntityInfoScreen.dart';
import 'package:flutter_entity_list/screens/HomeScreen.dart';
import 'package:flutter_entity_list/screens/SettingsScreen.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'authentication/authentication_controller.dart';
import 'authentication/authentication_service.dart';
import 'authentication/authentication_state.dart';
import 'authentication/login_page.dart';

void main() {
  initialize();
  runApp(MyApp());
}

void initialize() {
  Get.lazyPut(() => AuthenticationController(Get.put(InstanceAuthenticationService())),);
}

class MyApp extends GetWidget<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: new ThemeData(
          canvasColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      title: "Flutter Argus Entity List (FAEL)",
      home:Obx(() {
        if (controller.state is UnAuthenticated) {
          return LoginPage();
        }

        if (controller.state is Authenticated) {
          return HomeScreen(
            user: (controller.state as Authenticated).user,
          );
        }
        return SettingsScreen();
      }),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/einfo', page: () => EntityInfoScreen()),
        GetPage(name: '/settings', page: () => SettingsScreen()),
      ],

    );
  }
}