import 'package:flutter/widgets.dart';
import 'package:waveform_designer/theme/AppTheme.dart';

class SimpleButton extends StatelessWidget {
  final void Function() onClick;
  final Widget content;
  final Color color;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final bool disabled;

  SimpleButton({
    required this.onClick,
    required this.content,
    this.color = AppTheme.accentColor,
    this.padding,
    this.size,
    this.disabled = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:
          disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: disabled ? null : onClick,
        child: Container(
          width: size?.width,
          height: size?.height,
          decoration: BoxDecoration(
            color: disabled ? AppTheme.darkShade : color,
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
