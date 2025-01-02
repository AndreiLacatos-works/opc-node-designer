import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:opc_node_designer/serialization/waveform/waveform.model.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart'
    as OpcStructureState;

part 'opc_structure.model.g.dart';

enum OpcStructureType {
  unknown,
  container,
  value,
}

OpcStructureType _mapToOpcStructureType(
        OpcStructureState.OpcStructureNodeModel state) =>
    switch (state) {
      OpcStructureState.OpcContainerNodeModel() => OpcStructureType.container,
      OpcStructureState.OpcValueNodeModel() => OpcStructureType.value,
      _ => OpcStructureType.unknown,
    };

@JsonSerializable()
class OpcStructureNodeModel {
  final String id;
  final String label;
  final OpcStructureType type;
  final List<OpcStructureNodeModel>? children;
  final WaveFormModel? waveform;

  OpcStructureNodeModel({
    required this.id,
    required this.label,
    required this.type,
    this.children = null,
    this.waveform = null,
  });

  factory OpcStructureNodeModel.fromJson(Map<String, dynamic> json) =>
      _$OpcStructureNodeModelFromJson(json);

  factory OpcStructureNodeModel.fromState(
          OpcStructureState.OpcStructureNodeModel state) =>
      OpcStructureNodeModel(
        id: state.getId(),
        label: state.getLabel(),
        type: _mapToOpcStructureType(state),
        waveform: _mapToWaveForm(state),
        children: _mapToChildren(state),
      );

  Map<String, dynamic> toJson() => _$OpcStructureNodeModelToJson(this);

  OpcStructureState.OpcStructureNodeModel? toState() {
    return switch (this.type) {
      OpcStructureType.container => OpcStructureState.OpcContainerNodeModel(
          id: id,
          label: label,
          children: this
              .children!
              .map((c) => c.toState())
              .where((c) => c != null)
              .cast<OpcStructureState.OpcStructureNodeModel>()
              .toList(),
        ),
      OpcStructureType.value => OpcStructureState.OpcValueNodeModel(
          id: id,
          label: label,
          waveform: this.waveform!.toState(),
        ),
      _ => null,
    };
  }

  static WaveFormModel? _mapToWaveForm(
    OpcStructureState.OpcStructureNodeModel state,
  ) =>
      (state is OpcStructureState.OpcValueNodeModel)
          ? WaveFormModel.fromState(state.waveform)
          : null;

  static List<OpcStructureNodeModel>? _mapToChildren(
    OpcStructureState.OpcStructureNodeModel state,
  ) =>
      (state is OpcStructureState.OpcContainerNodeModel)
          ? state.children.map(OpcStructureNodeModel.fromState).toList()
          : null;
}

@JsonSerializable()
class OpcStructureModel {
  final OpcStructureNodeModel root;

  OpcStructureModel({
    required this.root,
  });

  factory OpcStructureModel.fromJson(Map<String, dynamic> json) =>
      _$OpcStructureModelFromJson(json);

  factory OpcStructureModel.fromState(
          OpcStructureState.OpcStructureModel state) =>
      OpcStructureModel(
        root: OpcStructureNodeModel.fromState(state.root),
      );

  Map<String, dynamic> toJson() => _$OpcStructureModelToJson(this);

  OpcStructureState.OpcStructureModel toState() =>
      OpcStructureState.OpcStructureModel(
        root: this.root.toState() as OpcStructureState.OpcContainerNodeModel,
      );
}
