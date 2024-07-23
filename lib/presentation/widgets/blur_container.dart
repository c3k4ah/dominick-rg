import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry? radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;

  const BlurContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    this.radius,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: SizedBox(
          height: height,
          width: width,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10.0,
              sigmaY: 10.0,
            ),
            child: Container(
              color: Colors.white.withOpacity(0.1),
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
