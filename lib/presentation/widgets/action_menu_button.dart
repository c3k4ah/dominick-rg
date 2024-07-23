import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';

class ActionMenuButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool? addBackground;
  final bool? isSelected;
  const ActionMenuButton({
    super.key,
    required this.title,
    required this.onTap,
    this.addBackground,
    this.isSelected,
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
                    mobileLarge: 15,
                    desktop: 15,
                  ),
                ),
              )
            : null,
        child: (isSelected != null)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: (addBackground ?? false)
                          ? Colors.black
                          : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 3,
                    width: (8 * title.replaceAll(' ', '').length).toDouble(),
                    color: primaryColor,
                  ),
                ],
              )
            : Text(
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
