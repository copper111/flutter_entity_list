import 'package:flutter_entity_list/common_services/utils.dart';
import 'package:flutter_entity_list/entity_list/api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_entity_list/authentication/api/loginApi.dart';
import 'package:logger/logger.dart';

class LoginService{
  final logger = Logger();
  var login;
  var password;
  var url;

  LoginService(this.login, this.password, this.url);

  Dio prepareConnection(){
    final dio = Dio();
    dio.interceptors.clear();
    dio.interceptors.add(LogInterceptor(responseBody: false));
    //dio.options.baseUrl = "http://${this.url}";
    dio.options.headers["authorization"] = Utils().getBasicAuth(this.login, this.password);   // config your dio headers globally
    dio.options.headers["Content-type"] = "application/json; charset=utf-8";
    dio.options.headers["content-type"] = "application/json; charset=utf-8";// config your dio headers globally
    dio.options.headers["User-Agent"] = "Argus-Android-Mobile-Arm-Client";
    dio.options.headers["Accept"] = "application/json";
    return dio;
  }

  RestClientLogin prepareClient(){
    return RestClientLogin(prepareConnection(), baseUrl: "http://${url}");
  }
}