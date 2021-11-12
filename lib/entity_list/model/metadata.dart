import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'metadata.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class EntityMetadata {
  @HiveField(0)
  dynamic caption;
  @HiveField(1)
  dynamic groupName;
  @HiveField(2)
  dynamic hint;
  @HiveField(3)
  dynamic readOnlyEdits;
  @HiveField(4)
  dynamic required;
  @HiveField(5)
  dynamic visible;
  @HiveField(6)
  dynamic showOnUI;
  @HiveField(7)
  dynamic exportable;
  @HiveField(8)
  dynamic groupIndex;
  @HiveField(9)
  dynamic orderIndex;
  @HiveField(10)
  dynamic displayIndex;
  @HiveField(11)
  dynamic compactView;
  @HiveField(12)
  dynamic sortable;
  @HiveField(13)
  dynamic createdFrom;
  @HiveField(14)
  dynamic cellStyle;
  @HiveField(15)
  dynamic maxLength;
  @HiveField(16)
  dynamic linesHeight;
  @HiveField(17)
  dynamic editMask;
  @HiveField(18)
  dynamic regExpMask;
  @HiveField(19)
  dynamic useSimpleFilter;
  @HiveField(20)
  dynamic needCompleteMask;
  @HiveField(21)
  dynamic selector;
  @HiveField(22)
  dynamic root;
  @HiveField(23)
  dynamic refValue;
  @HiveField(24)
  dynamic refEntityKeyword;
  @HiveField(25)
  dynamic realCaption;
  @HiveField(26)
  InitValueRaw initValueRaw;
  @HiveField(27)
  dynamic attributeName;
  @HiveField(28)
  dynamic editorClass;
  @HiveField(29)
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

@HiveType(typeId: 4)
@JsonSerializable()
class InitValueRaw {
  @HiveField(0)
  dynamic value;
  @HiveField(1)
  dynamic desc;

  InitValueRaw(this.value, this.desc);

  factory InitValueRaw.fromJson(Map<String, dynamic> json) => _$InitValueRawFromJson(json);
  Map<String, dynamic> toJson() => _$InitValueRawToJson(this);
}