import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:waveform_designer/state/opc_structure/opc_structure.model.dart';
import 'package:waveform_designer/state/waveform/waveform.model.dart';

part 'opc_structure.state.g.dart';

@riverpod
class OpcStructureState extends _$OpcStructureState {
  static OpcStructureModel _makeInitialState() {
    final uuid = Uuid();
    return OpcStructureModel(
      root: OpcContainerNodeModel(
        id: uuid.v4(),
        children: [
          OpcContainerNodeModel(
            id: uuid.v4(),
            children: [
              OpcContainerNodeModel(
                id: uuid.v4(),
                children: [
                  OpcContainerNodeModel(
                    id: uuid.v4(),
                    children: [],
                    label: "Container 4",
                  ),
                  OpcValueNodeModel(
                    id: uuid.v4(),
                    label: "Value 2",
                    waveform: WaveFormModel(
                      duration: 1700,
                      tickFrequency: 50,
                      values: [
                        WaveFormValue(
                          tick: 0,
                          value: 21.0,
                        ),
                        WaveFormValue(
                          tick: 350,
                          value: 171.7,
                        ),
                        WaveFormValue(
                          tick: 500,
                          value: 27.0,
                        ),
                        WaveFormValue(
                          tick: 950,
                          value: 37.7,
                        ),
                        WaveFormValue(
                          tick: 1400,
                          value: 9.0,
                        ),
                        WaveFormValue(
                          tick: 1550,
                          value: 156.7,
                        ),
                      ],
                    ),
                  ),
                  OpcValueNodeModel(
                    id: uuid.v4(),
                    label: "Value 3",
                    waveform: WaveFormModel(
                      duration: 800,
                      tickFrequency: 50,
                      values: [
                        WaveFormValue(
                          tick: 0,
                          value: 9.0,
                        ),
                        WaveFormValue(
                          tick: 350,
                          value: 21.0,
                        ),
                        WaveFormValue(
                          tick: 500,
                          value: 27.0,
                        ),
                        WaveFormValue(
                          tick: 550,
                          value: 156.7,
                        ),
                        WaveFormValue(
                          tick: 600,
                          value: 171.7,
                        ),
                        WaveFormValue(
                          tick: 750,
                          value: 37.7,
                        ),
                      ],
                    ),
                  ),
                ],
                label: "Container 3",
              ),
            ],
            label: "Container 1",
          ),
          OpcContainerNodeModel(
            id: uuid.v4(),
            children: [],
            label: "Container 2",
          ),
          OpcValueNodeModel(
            id: uuid.v4(),
            label: "Value 1",
            waveform: WaveFormModel(
              duration: 1000,
              tickFrequency: 100,
              values: [
                WaveFormValue(
                  tick: 400,
                  value: 83.0,
                ),
                WaveFormValue(
                  tick: 600,
                  value: 171.7,
                ),
              ],
            ),
          ),
        ],
        label: "Root",
      ),
    );
  }

  @override
  OpcStructureModel build() {
    return _makeInitialState();
  }
}
