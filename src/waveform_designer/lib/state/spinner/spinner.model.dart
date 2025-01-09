import 'package:freezed_annotation/freezed_annotation.dart';

part 'spinner.model.freezed.dart';

@freezed
class SpinnerModel with _$SpinnerModel {
  factory SpinnerModel({
    required bool active,
  }) = _SpinnerModel;
}
