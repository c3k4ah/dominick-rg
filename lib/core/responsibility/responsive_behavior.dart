import 'package:flutter/widgets.dart';

class ResponsiveBehavior {
  final BuildContext context;
  ResponsiveBehavior(this.context);

  bool get isSmall => MediaQuery.of(context).size.width <= 300;

  bool get isMobile => MediaQuery.of(context).size.width <= 500;

  bool get isMobileLarge => MediaQuery.sizeOf(context).width <= 700;

  bool get isTablet => MediaQuery.sizeOf(context).width < 1024;

  bool get isDesktop => MediaQuery.sizeOf(context).width >= 1024;

  bool get isLargeDesktop => MediaQuery.sizeOf(context).width >= 1700;
}

class ResponsiveLayout extends StatelessWidget {
  final Widget? small;
  final Widget mobile;
  final Widget mobileLarge;
  final Widget tablet;
  final Widget desktop;
  final Widget largeDesktop;

  const ResponsiveLayout({
    Key? key,
    this.small,
    required this.mobile,
    required this.mobileLarge,
    required this.tablet,
    required this.desktop,
    required this.largeDesktop,
  }) : super(key: key);

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width <= 300;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 390;

  static bool isMobileLarge(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 500;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 700;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1024;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 1700;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop(context)) {
          return desktop;
        } else if (isLargeDesktop(context)) {
          return largeDesktop;
        } else if (isTablet(context)) {
          return tablet;
        } else if (isMobileLarge(context)) {
          return mobileLarge;
        } else if (small != null && isSmall(context)) {
          return small!;
        } else {
          return mobile;
        }
      },
    );
  }
}

class ResponsiveSize {
  static double number({
    required BuildContext context,
    double? small,
    required double mobile,
    required double mobileLarge,
    required double tablet,
    required double desktop,
    double? largeDesktop,
  }) {
    final Size size = MediaQuery.sizeOf(context);

    if (largeDesktop != null && size.width >= 1700) {
      return largeDesktop;
    } else if (size.width >= 1024) {
      return desktop;
    } else if (size.width >= 700) {
      return tablet;
    } else if (size.width >= 500) {
      return mobileLarge;
    } else if (size.width >= 390) {
      return mobile;
    } else if (small != null && size.width >= 300) {
      return small;
    } else {
      return mobile;
    }
  }
}

double getNecessaryPadding({
  required BuildContext context,
  required bool disable,
}) {
  double width = MediaQuery.sizeOf(context).width;
  double myWidth = 1000;
  double ratio = width / myWidth;
  if (disable) {
    return 0;
  } else if (width <= myWidth) {
    return 50;
  }
  //  else if (width >= 1600) {
  //   return width * (ratio / 9);
  // }

  double padding = width * (ratio / 10);

  return padding;
}

