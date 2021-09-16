import 'package:flutter_entity_list/authentication/api/login_api.dart';
import 'package:flutter_entity_list/authentication/api/login_service.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class AuthenticationService extends GetxService {
  Future<LoginInfo> getCurrentUser();
  Future<LoginInfo> signInWithEmailAndPassword(String email, String password, String url);
  Dio getCurrentConnection();
  String getCurrentBaseUrl();
  Future<void> signOut();
}

class InstanceAuthenticationService extends AuthenticationService {
  Future<LoginInfo> currentUser;
  Dio currentConnection;
  String currentBaseUrl;


  @override
  Future<LoginInfo> getCurrentUser() async {
    return this.currentUser;
  }

  @override
  Future<LoginInfo> signInWithEmailAndPassword(String email, String password, String url) async {

      this.currentUser =
          LoginService(email, password, url).prepareClient().getLoginInfo();
      this.currentConnection =
          LoginService(email, password, url).prepareConnection();
      this.currentBaseUrl = url;
    return currentUser;
  }

  @override
  Future<void> signOut() async {}

  @override
  Dio getCurrentConnection() {
    return this.currentConnection;
  }

  @override
  String getCurrentBaseUrl() {
    return this.currentBaseUrl;
  }
}

class AuthenticationException implements Exception {
  final String message;

  AuthenticationException({this.message = 'Unknown error occurred. '});
}