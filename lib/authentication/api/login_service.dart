import 'package:dio/dio.dart';
import 'package:flutter_entity_list/authentication/api/loginApi.dart';
import 'package:flutter_entity_list/common_services/utils.dart';
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
    // это базовый УРЛ, тот который будет подставляться если ни в аннотации к API,
    // ни в конструкторе рестклиента не указали явно другой УРЛ
    dio.options.baseUrl = "http://${this.url}:8080/";
    dio.options.headers["authorization"] = Utils().getBasicAuth(this.login, this.password);   // config your dio headers globally
    dio.options.headers["Content-type"] = "application/json; charset=utf-8";
    dio.options.headers["content-type"] = "application/json; charset=utf-8";// config your dio headers globally
    dio.options.headers["User-Agent"] = "Argus-Android-Mobile-Arm-Client";
    dio.options.headers["Accept"] = "application/json";

    return dio;
  }

  RestClientLogin prepareClient(){
    // так как у нас доступ к апи логина и к апи НРИ размещены на разных портах
    // приходится жонглировать разными урлами в расчете на их корректную приоретизацию (см. доки)
    return RestClientLogin(prepareConnection(), baseUrl: "http://${url}:8190/");
  }
}