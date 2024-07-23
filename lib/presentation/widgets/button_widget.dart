import 'package:flutter/material.dart';

import '../../core/responsibility/responsive_behavior.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  const ButtonWidget({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveSize.number(
        context: context,
        mobile: 30,
        mobileLarge: 50,
        tablet: 40,
        desktop: 40,
      ),
      // width: ResponsiveSize.number(
      //   context: context,
      //   mobile: 150,
      //   mobileLarge: 180,
      //   tablet: 180,
      //   desktop: 200,
      // ),
      child: MaterialButton(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            ResponsiveSize.number(
              context: context,
              mobile: 8,
              mobileLarge: 10,
              tablet: 10,
              desktop: 10,
            ),
          ),
        ),
        onPressed: () {},
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
    );
  }
}
