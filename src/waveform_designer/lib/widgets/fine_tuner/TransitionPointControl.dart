import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../input/LabeledInput.dart';

class TransitionPointControl extends StatelessWidget {
  const TransitionPointControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LabeledInput(
          label: "ms",
          width: 80,
          onChanged: (value) {},
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 8, 0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: FaIcon(
                FontAwesomeIcons.arrowLeft,
                color: Color.fromARGB(255, 87, 237, 67),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: FaIcon(
                FontAwesomeIcons.arrowRight,
                color: Color.fromARGB(255, 87, 237, 67),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
