// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntityMetadata _$EntityMetadataFromJson(Map<String, dynamic> json) {
  return EntityMetadata(
    json['caption'],
    json['groupName'],
    json['hint'],
    json['readOnlyEdits'] as bool,
    json['required'] as bool,
    json['visible'] as bool,
    json['showOnUI'] as bool,
    json['exportable'] as bool,
    json['groupIndex'],
    json['orderIndex'],
    json['displayIndex'],
    json['compactView'] as bool,
    json['sortable'] as bool,
    json['createdFrom'],
    json['cellStyle'],
    json['maxLength'],
    json['linesHeight'],
    json['editMask'],
    json['regExpMask'],
    json['useSimpleFilter'] as bool,
    json['needCompleteMask'] as bool,
    json['selector'],
    json['root'],
    json['refValue'] as bool,
    json['refEntityKeyword'],
    json['realCaption'],
    json['initValueRaw'] == null
        ? null
        : InitValueRaw.fromJson(json['initValueRaw'] as Map<String, dynamic>),
    json['attributeName'],
    json['editorClass'],
    json['cvClass'],
  );
}

Map<String, dynamic> _$EntityMetadataToJson(EntityMetadata instance) =>
    <String, dynamic>{
      'caption': instance.caption,
      'groupName': instance.groupName,
      'hint': instance.hint,
      'readOnlyEdits': instance.readOnlyEdits,
      'required': instance.required,
      'visible': instance.visible,
      'showOnUI': instance.showOnUI,
      'exportable': instance.exportable,
      'groupIndex': instance.groupIndex,
      'orderIndex': instance.orderIndex,
      'displayIndex': instance.displayIndex,
      'compactView': instance.compactView,
      'sortable': instance.sortable,
      'createdFrom': instance.createdFrom,
      'cellStyle': instance.cellStyle,
      'maxLength': instance.maxLength,
      'linesHeight': instance.linesHeight,
      'editMask': instance.editMask,
      'regExpMask': instance.regExpMask,
      'useSimpleFilter': instance.useSimpleFilter,
      'needCompleteMask': instance.needCompleteMask,
      'selector': instance.selector,
      'root': instance.root,
      'refValue': instance.refValue,
      'refEntityKeyword': instance.refEntityKeyword,
      'realCaption': instance.realCaption,
      'initValueRaw': instance.initValueRaw,
      'attributeName': instance.attributeName,
      'editorClass': instance.editorClass,
      'cvClass': instance.cvClass,
    };

InitValueRaw _$InitValueRawFromJson(Map<String, dynamic> json) {
  return InitValueRaw(
    json['value'] as int,
    json['desc'] as String,
  );
}

Map<String, dynamic> _$InitValueRawToJson(InitValueRaw instance) =>
    <String, dynamic>{
      'value': instance.value,
      'desc': instance.desc,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClientMetadata implements RestClientMetadata {
  _RestClientMetadata(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'nope';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<List<EntityMetadata>> getEntityMetadata(entityId, iuk) async {
    ArgumentError.checkNotNull(entityId, 'entityId');
    ArgumentError.checkNotNull(iuk, 'iuk');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>(
        ':8080/argus/webresources/system/inf/inventory/metadata/entities/$entityId/iuc/$iuk/custom-values?fetch-possible-values=false',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => EntityMetadata.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
