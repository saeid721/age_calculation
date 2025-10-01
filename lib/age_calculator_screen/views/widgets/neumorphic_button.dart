import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphicButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final bool light;
  final double depth;
  final Color? color;
  final BorderRadius? borderRadius;

  const NeumorphicButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.light = false,
    this.depth = 4,
    this.color,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> rowChildren = [];
    if (icon != null) {
      rowChildren.add(Icon(icon, size: 20));
      rowChildren.add(const SizedBox(width: 8));
    }
    rowChildren.add(Text(text));
    final Color effectiveColor = this.color ??
        (light
            ? (NeumorphicTheme.isUsingDark(context)
                ? Colors.white
                : Colors.grey[700]!)
            : (NeumorphicTheme.baseColor(context) ?? Colors.grey[300]!));

    return NeumorphicButton(
      onPressed: onPressed,
      style: NeumorphicStyle(
        depth: depth,
        color: effectiveColor,
        boxShape: NeumorphicBoxShape.roundRect(borderRadius ?? BorderRadius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: rowChildren,
        ),
      ),
    );
  }
}