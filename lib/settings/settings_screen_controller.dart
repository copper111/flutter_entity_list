import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreenController extends GetxController{

  var isSwitched = false;

  void changeTheme(bool value) {
    if(value)
      Get.changeThemeMode(ThemeMode.dark);
    else
      Get.changeThemeMode(ThemeMode.light);
    this.isSwitched = value;
    update();
  }

}