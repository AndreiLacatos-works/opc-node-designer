import 'package:flutter/widgets.dart';
import 'package:opc_node_designer/theme/AppTheme.dart';
import 'package:opc_node_designer/widgets/shared/SimpleButton.dart';

class TextButton extends StatelessWidget {
  final void Function() onClick;
  final String text;
  final Color color;
  final Color textColor;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final bool disabled;

  TextButton({
    required this.onClick,
    required this.text,
    this.color = AppTheme.accentColor,
    this.textColor = AppTheme.foreground,
    this.padding,
    this.size,
    this.disabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16.0,
        ),
      ),
    );

    return SimpleButton(
      onClick: onClick,
      color: color,
      size: size,
      padding: padding,
      content: content,
      disabled: disabled,
    );
  }
}
