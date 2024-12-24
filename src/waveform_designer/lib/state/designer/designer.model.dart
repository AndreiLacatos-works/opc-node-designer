import 'package:freezed_annotation/freezed_annotation.dart';

part 'designer.model.freezed.dart';

@freezed
class DesignerModel with _$DesignerModel {
  factory DesignerModel({
    required double designerWidth,
    required double sliceRatio,
    required double sliceOffset,
    required String? projectPath,
  }) = _DesignerModel;
}
