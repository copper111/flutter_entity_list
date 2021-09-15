import 'package:flutter_entity_list/authentication/authentication_controller.dart';
import 'package:flutter_entity_list/authentication/authentication_state.dart';
import 'package:flutter_entity_list/entity_list/api/api.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ApiService{
  final logger = Logger();

  RestClient prepareClient(){
    final AuthenticationController _authenticationController = Get.find();
    return RestClient((_authenticationController.state as Authenticated).connection, baseUrl: "http://${(_authenticationController.state as Authenticated).currentBaseUrl}");
  }
}