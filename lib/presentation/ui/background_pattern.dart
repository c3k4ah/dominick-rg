import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/responsibility/responsive_behavior.dart';

class BackGroundPattern extends StatelessWidget {
  final Widget child;
  const BackGroundPattern({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ResponsiveBehavior responsiveBehavior = ResponsiveBehavior(context);
    bool isNotMobile =
        (!responsiveBehavior.isMobile && !responsiveBehavior.isMobileLarge);

    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            child: SvgPicture.asset(
              'assets/images/bg_pattern.svg',
              fit: isNotMobile ? BoxFit.fitWidth : BoxFit.none,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height, child: child),
        ],
      ),
    );
  }
}
