import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:web_portfolio/core/constants/colors.dart';

import '../widgets/action_menu_button.dart';

class AppDrawer extends StatelessWidget {
  final Function()? onCloseMenu;
  const AppDrawer({super.key, this.onCloseMenu});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.black,
          border: DashedBorder(
            dashLength: 15,
            left: BorderSide(color: primaryColor, width: 4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: onCloseMenu,
              icon: const Icon(
                Icons.close,
                color: primaryColor,
              ),
            ),
            ActionMenuButton(
              title: 'A-propos',
              onTap: () {},
            ),
            ActionMenuButton(
              title: 'Projets',
              onTap: () {},
              isSelected: true,
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
            ),
          ],
        ),
      ),
    );
  }
}
