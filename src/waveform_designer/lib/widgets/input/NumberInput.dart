import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:waveform_designer/theme/AppTheme.dart';

class NumberInput<T extends num> extends StatefulWidget {
  final Function(T?)? onChanged;
  final Function(T?)? onSubmitted;
  final Function(T?)? onFocusLost;
  final Function()? onFocus;
  final double? width;
  final T value;

  const NumberInput({
    required this.onChanged,
    required this.value,
    this.width,
    this.onSubmitted,
    this.onFocusLost,
    this.onFocus,
    super.key,
  });

  @override
  _NumberInputState createState() => _NumberInputState<T>();
}

class _NumberInputState<T extends num> extends State<NumberInput<T>> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus && widget.onFocus != null) {
        widget.onFocus!();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  List<TextInputFormatter> get formatters {
    return switch (T) {
      int => [FilteringTextInputFormatter.digitsOnly],
      double => [FilteringTextInputFormatter.allow(RegExp(r"^-?\d+\.?\d*$"))],
      _ => throw "${T} is not a supported NumberInput type",
    };
  }

  T? parseValue(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    final res = switch (T) {
      int => int.parse(value),
      double => double.parse(double.parse(value).toStringAsFixed(2)),
      _ => 0 as T,
    };
    return res as T;
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.value.toString();

    return SizedBox(
      width: widget.width ?? 100,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.foreground,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
        child: EditableText(
          controller: _controller,
          focusNode: _focusNode,
          inputFormatters: formatters,
          cursorColor: Color(0xFF000000),
          backgroundCursorColor: Color(0xFFFFFFFF),
          onChanged: (String val) {
            widget.onChanged?.call(parseValue(val));
          },
          onSubmitted: (String val) {
            _focusNode.unfocus();
            widget.onSubmitted?.call(parseValue(val));
          },
          onTapOutside: (_) {
            _focusNode.unfocus();
            final val = _controller.text;
            widget.onFocusLost?.call(parseValue(val));
          },
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
