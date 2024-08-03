import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';

class ActionMenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? addBackground;

  const ActionMenuButton({
    super.key,
    required this.title,
    required this.onTap,
    this.addBackground,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: primaryColor.withOpacity(0.5),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: (addBackground != null)
            ? BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(
                  ResponsiveSize.number(
                    context: context,
                    mobile: 50,
                    tablet: 8,
                    mobileLarge: 13,
                    desktop: 13,
                  ),
                ),
              )
            : null,
        child: Text(
          title,
          style: TextStyle(
            color: (addBackground ?? false) ? Colors.black : Colors.white,
            fontSize: ResponsiveSize.number(
              context: context,
              mobile: 20,
              tablet: 12,
              mobileLarge: 20,
              desktop: 20,
            ),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
