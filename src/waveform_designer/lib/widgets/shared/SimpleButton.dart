import 'package:flutter/widgets.dart';
import 'package:waveform_designer/theme/AppTheme.dart';

class SimpleButton extends StatelessWidget {
  final void Function() onClick;
  final Widget content;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final Size? size;

  SimpleButton({
    required this.onClick,
    required this.content,
    this.color = AppTheme.accentColor,
    this.padding,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          width: size?.width,
          height: size?.height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(6),
          ),
          child: padding != null
              ? Padding(
                  padding: padding!,
                  child: content,
                )
              : content,
        ),
      ),
    );
  }
}
