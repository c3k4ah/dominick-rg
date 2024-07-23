import 'package:flutter/material.dart';

import '../../core/responsibility/responsive_behavior.dart';

class BigTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const BigTitleWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      width: double.infinity,
      // color: Colors.amber,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: ResponsiveSize.number(
                context: context,
                mobile: 20,
                mobileLarge: 30,
                tablet: 40,
                desktop: 50,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: ResponsiveSize.number(
                context: context,
                mobile: 10,
                mobileLarge: 15,
                tablet: 15,
                desktop: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
