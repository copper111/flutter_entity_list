// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_list_api_remote.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<Entity>> getEntities(entityId, iucKeyword, possibleFilterStates,
      sortingRules, firstRow, maxRows) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    ArgumentError.checkNotNull(iucKeyword, 'iucKeyword');
    ArgumentError.checkNotNull(possibleFilterStates, 'possibleFilterStates');
    ArgumentError.checkNotNull(sortingRules, 'sortingRules');
    ArgumentError.checkNotNull(firstRow, 'firstRow');
    ArgumentError.checkNotNull(maxRows, 'maxRows');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sorting-rules[]': sortingRules,
      r'first-row': firstRow,
      r'max-rows': maxRows
    };
    final _data = possibleFilterStates.map((e) => e.toJson()).toList();
    final _result = await _dio.request<List<dynamic>>(
        'argus/webresources/system/inf/inventory/api/entities/$entityId/iuc/$iucKeyword/instances/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => Entity.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
