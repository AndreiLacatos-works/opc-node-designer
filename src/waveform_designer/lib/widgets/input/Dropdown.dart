import 'package:flutter/widgets.dart';
import 'package:waveform_designer/theme/AppTheme.dart';

class Dropdown extends StatefulWidget {
  final List<String> items;
  final String selectedItem;
  final Function(String) onChanged;

  Dropdown({
    required this.items,
    required this.onChanged,
    required this.selectedItem,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<Dropdown> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      _openDropdown();
    }
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy + size.height,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: widget.items.map((item) {
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    widget.onChanged(item);
                    _closeDropdown();
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: AppTheme.foreground,
                    ),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: AppTheme.textColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: CompositedTransformTarget(
          link: _layerLink,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.textColor),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              widget.selectedItem,
              style: TextStyle(color: AppTheme.textColor, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
