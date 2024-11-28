import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class NumberInput extends StatefulWidget {
  final Function(int?) onChanged;
  final double? width;

  const NumberInput({
    required this.onChanged,
    this.width,
    Key? key,
  }) : super(key: key);

  @override
  _NumberInputState createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  final TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 100,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        child: EditableText(
          controller: _controller,
          focusNode: _focusNode,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorColor: Color(0xFF000000),
          backgroundCursorColor: Color(0xFFFFFFFF),
          onChanged: (String val) => widget.onChanged(
            val.isEmpty ? null : int.parse(val),
          ),
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
