import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'login_api.g.dart';

@RestApi()
abstract class RestClientLogin {
  factory RestClientLogin(Dio dio, {String baseUrl}) = _RestClientLogin;
  @GET("api/authentication/logininfo")
  Future<LoginInfo> getLoginInfo();
}

 @JsonSerializable()
 class LoginInfo {
  dynamic id;
  dynamic loginName;
  dynamic workerName;
  dynamic homeRegion;
  dynamic workerId;
  dynamic timeZoneId;
  dynamic workerStatusId;
  dynamic changeStatusDate;
  List<dynamic> securityRoles;

  LoginInfo(
      this.id,
      this.loginName,
      this.workerName,
      this.homeRegion,
      this.workerId,
      this.timeZoneId,
      this.workerStatusId,
      this.changeStatusDate,
      this.securityRoles);

  factory LoginInfo.fromJson(Map<String, dynamic> json) => _$LoginInfoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
}