// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginApi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) {
  return LoginInfo(
    json['id'] as int,
    json['loginName'] as String,
    json['workerName'] as String,
    json['homeRegion'] as String,
    json['workerId'] as int,
    json['timeZoneId'] as String,
    json['workerStatusId'] as String,
    json['changeStatusDate'],
    (json['securityRoles'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$LoginInfoToJson(LoginInfo instance) => <String, dynamic>{
      'id': instance.id,
      'loginName': instance.loginName,
      'workerName': instance.workerName,
      'homeRegion': instance.homeRegion,
      'workerId': instance.workerId,
      'timeZoneId': instance.timeZoneId,
      'workerStatusId': instance.workerStatusId,
      'changeStatusDate': instance.changeStatusDate,
      'securityRoles': instance.securityRoles,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClientLogin implements RestClientLogin {
  _RestClientLogin(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<LoginInfo> getLoginInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'api/authentication/logininfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginInfo.fromJson(_result.data);
    return value;
  }
}
