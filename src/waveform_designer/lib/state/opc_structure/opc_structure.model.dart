import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

part 'opc_structure.model.freezed.dart';

abstract class OpcStructureNodeModel {
  String getLabel();
}

@freezed
class OpcContainerNodeModel
    with _$OpcContainerNodeModel
    implements OpcStructureNodeModel {
  factory OpcContainerNodeModel({
    required List<OpcStructureNodeModel> children,
    required String label,
  }) = _OpcContainerNodeModel;

  @override
  String getLabel() {
    return this.label;
  }
}

@freezed
class OpcValueNodeModel
    with _$OpcValueNodeModel
    implements OpcStructureNodeModel {
  factory OpcValueNodeModel({
    required String label,
    required WaveFormModel waveform,
  }) = _OpcValueNodeModel;

  @override
  String getLabel() {
    return this.label;
  }
}

@freezed
class OpcStructureModel with _$OpcStructureModel {
  factory OpcStructureModel({
    required OpcContainerNodeModel root,
  }) = _OpcStructureModel;
}
