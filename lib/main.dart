import 'package:flutter/material.dart';
import 'package:flutter_entity_list/entity_info/entity_info_page.dart';
import 'package:flutter_entity_list/entity_list/home_page.dart';
import 'package:flutter_entity_list/settings/settings_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'authentication/authentication_controller.dart';
import 'authentication/authentication_service.dart';
import 'authentication/authentication_state.dart';
import 'authentication/login_page.dart';
import 'entity_list/entity_list_repository.dart';
import 'entity_list/model/entity.dart';
import 'entity_list/model/metadata.dart';

void main() {
  initServices();
  runApp(MyApp());
}

/// Инициализируем основные сервисы, которые будут доступны на протяжениии всего
/// времени жизни приложения
void initServices() async{
  print('Запуск сервисов...');
  // серсис авторизации (хранит информацию о текущем пользователе)
  Get.lazyPut(() => AuthenticationController(Get.put(InstanceAuthenticationService())),);
  // репозиторий для сущности
  Get.lazyPut(() => EntityListRepository());
  // синглтон shared preference
  //PreferenceUtils.init();

  // NOSQL DB
  // var path = await getApplicationDocumentsDirectory();

  Hive
    ..initFlutter()
    ..registerAdapter(EntityAdapter())
    ..registerAdapter(AttributesRawAdapter())
    ..registerAdapter(EntityMetadataAdapter())
    ..registerAdapter(InitValueRawAdapter());

  print('Все сервисы запущены...');
}


class MyApp extends GetWidget<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      theme: new ThemeData(
          canvasColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      title: "Flutter Argus Entity List (FAEL)",
      home: Obx(() {
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
        GetPage(name: '/login', page: () => LoginPage()),
      ],

    );
  }
}