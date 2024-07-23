import 'dart:ui';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';
import 'action_menu_button.dart';
import 'blur_container.dart';

class BlurAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTapMenu;
  const BlurAppBar({
    super.key,
    this.onTapMenu,
  });
  @override
  Size get preferredSize => const Size.fromHeight(100);
  @override
  Widget build(BuildContext context) {
    final ResponsiveBehavior responsiveBehavior = ResponsiveBehavior(context);
    bool isNotMobile =
        (!responsiveBehavior.isMobile && !responsiveBehavior.isMobileLarge);
    return BlurContainer(
      height: ResponsiveSize.number(
        context: context,
        mobile: 50,
        mobileLarge: 90,
        tablet: 100,
        desktop: 100,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            'DOMINICK',
            style: TextStyle(
              fontSize: ResponsiveSize.number(
                context: context,
                mobile: 15,
                tablet: 20,
                mobileLarge: 20,
                desktop: 30,
              ),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          if (isNotMobile) ...[
            ActionMenuButton(
              title: 'Projets',
              onTap: () {},
            ),
            ActionMenuButton(
              title: 'Expériences',
              onTap: () {},
            ),
            ActionMenuButton(
              title: 'Skills',
              onTap: () {},
            ),
            ActionMenuButton(
              title: 'Hackathons',
              onTap: () {},
            ),
            ActionMenuButton(
              title: 'Mes contacts',
              onTap: () {},
              addBackground: true,
            ),
          ],
          if (!isNotMobile)
            IconButton(
              onPressed: onTapMenu,
              icon: const Icon(
                Icons.menu,
                color: primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
