import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';
import '../../core/utils/default_img_loading.dart';
import '../widgets/action_menu_button.dart';

class AppDrawer extends StatelessWidget {
  final Function()? onCloseMenu;
  final Function(int id) onTapItem;
  const AppDrawer({super.key, this.onCloseMenu, required this.onTapItem});

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
              title: 'About',
              onTap: () => onTapItem(0),
            ),
            ActionMenuButton(
              title: 'Projects',
              onTap: () => onTapItem(2),
            ),
            ActionMenuButton(
              title: 'Experiences',
              onTap: () => onTapItem(3),
            ),
            ActionMenuButton(
              title: 'Skills',
              onTap: () => onTapItem(4),
            ),
            ActionMenuButton(
              title: 'Awards',
              onTap: () => onTapItem(5),
            ),
            ActionMenuButton(
              title: 'Contacts',
              onTap: () => onTapItem(6),
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Dodo zaza !!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveSize.number(
                          context: context,
                          mobile: 10,
                          tablet: 10,
                          mobileLarge: 10,
                          desktop: 15,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgWidgetPlaceholder(
                      asset: 'assets/images/sleep.svg',
                      fit: BoxFit.fitHeight,
                      width: MediaQuery.sizeOf(context).width,
                      height: 200,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
