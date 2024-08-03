import 'package:flutter/material.dart';

import '../../core/responsibility/responsive_behavior.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final Function()? onPressed;
  const ButtonWidget({
    super.key,
    required this.color,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: ResponsiveSize.number(
          context: context,
          mobile: 30,
          mobileLarge: 45,
          tablet: 40,
          desktop: 40,
        ),
        width: ResponsiveSize.number(
          context: context,
          mobile: 150,
          mobileLarge: 180,
          tablet: 180,
          desktop: 200,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ResponsiveSize.number(
              context: context,
              mobile: 8,
              mobileLarge: 10,
              tablet: 10,
              desktop: 10,
            ),
          ),
          color: color,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveSize.number(
                context: context,
                mobile: 10,
                mobileLarge: 15,
                tablet: 15,
                desktop: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
