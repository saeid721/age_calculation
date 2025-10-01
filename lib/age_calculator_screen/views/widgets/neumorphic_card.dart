import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphicCardWidget extends StatelessWidget {
  final Widget child;
  final double depth;
  final Color? color;
  final BorderRadius? borderRadius;

  const NeumorphicCardWidget({
    Key? key,
    required this.child,
    this.depth = 8,
    this.color,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: depth,
        color: color ?? Colors.grey[200],
        boxShape: NeumorphicBoxShape.roundRect(borderRadius ?? BorderRadius.circular(16)),
      ),
      child: child,
    );
  }
}
