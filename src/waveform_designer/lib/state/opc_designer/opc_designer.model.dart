import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opc_node_designer/state/opc_structure/opc_structure.model.dart';

part 'opc_designer.model.freezed.dart';

@freezed
class OpcDesignerModel with _$OpcDesignerModel {
  factory OpcDesignerModel({
    required OpcStructureNodeModel? selectedNode,
    required List<OpcContainerNodeModel> expandedContainers,
  }) = _OpcDesignerModel;
}
