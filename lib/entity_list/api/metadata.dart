import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'metadata.g.dart';

@RestApi()
abstract class RestClientMetadata {
  factory RestClientMetadata(Dio dio, {String baseUrl}) = _RestClientMetadata;

  @GET("argus/webresources/system/inf/inventory/metadata/entities/{entity-id}/iuc/{iuc-keyword}/custom-values?fetch-possible-values=false")
  Future<List<EntityMetadata>> getEntityMetadata(@Path("entity-id") int entityId, @Path("iuc-keyword") String iuk);
}

@JsonSerializable()
class EntityMetadata {
  dynamic caption;
  dynamic groupName;
  dynamic hint;
  bool readOnlyEdits;
  bool required;
  bool visible;
  bool showOnUI;
  bool exportable;
  dynamic groupIndex;
  dynamic orderIndex;
  dynamic displayIndex;
  bool compactView;
  bool sortable;
  dynamic createdFrom;
  dynamic cellStyle;
  dynamic maxLength;
  dynamic linesHeight;
  dynamic editMask;
  dynamic regExpMask;
  bool useSimpleFilter;
  bool needCompleteMask;
  dynamic selector;
  dynamic root;
  bool refValue;
  dynamic refEntityKeyword;
  dynamic realCaption;
  InitValueRaw initValueRaw;
  dynamic attributeName;
  dynamic editorClass;
  dynamic cvClass;


  EntityMetadata(
      this.caption,
      this.groupName,
      this.hint,
      this.readOnlyEdits,
      this.required,
      this.visible,
      this.showOnUI,
      this.exportable,
      this.groupIndex,
      this.orderIndex,
      this.displayIndex,
      this.compactView,
      this.sortable,
      this.createdFrom,
      this.cellStyle,
      this.maxLength,
      this.linesHeight,
      this.editMask,
      this.regExpMask,
      this.useSimpleFilter,
      this.needCompleteMask,
      this.selector,
      this.root,
      this.refValue,
      this.refEntityKeyword,
      this.realCaption,
      this.initValueRaw,
      this.attributeName,
      this.editorClass,
      this.cvClass);

  factory EntityMetadata.fromJson(Map<String, dynamic> json) => _$EntityMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$EntityMetadataToJson(this);
}

@JsonSerializable()
class InitValueRaw {
  int value;
  String desc;

  InitValueRaw(this.value, this.desc);

  factory InitValueRaw.fromJson(Map<String, dynamic> json) => _$InitValueRawFromJson(json);
  Map<String, dynamic> toJson() => _$InitValueRawToJson(this);
}