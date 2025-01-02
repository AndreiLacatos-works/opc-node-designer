# Node structure definition

Supports two types of OPC nodes:

- **Container Nodes** (used for organizational purposes)
- **Value Nodes** (nodes with values defined by a specific data type)

A **container node** simply holds other nodes which can be either value nodes or other container nodes, only the label is required. A **value node** defines an OPC node that provides a value. Currently boolean and numeric nodes are supported. When creating a value node the label and the data type is required, neither can be changed later. To define the behavior of a value node refer to [Diagram definition](/docs/Diagram%20definition.md).

All custom nodes are organized under the root container called "Application root" (cannot be renamed). To add a node, simply click the button labeled as "Add node", it will prompt the required information. To add a container node click the button labeled "Add container". To add nodes (or containers) to any container other than "Application root", first select the desired container by clicking it and then press the desired "Add xyz" button.
