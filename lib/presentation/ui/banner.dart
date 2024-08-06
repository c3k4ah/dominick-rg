import 'package:flutter/material.dart';
import 'package:marquee_list/marquee_list.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';

List<String> bannerTextList = [
  for (var i = 0; i < 5; i++) ...[
    'Flutter developer',
    'designer',
    'OSINT Analyst',
    'freelancer',
  ]
];

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BorderSide borderSide = BorderSide(
      color: primaryColor,
      width: ResponsiveSize.number(
        context: context,
        mobile: 3,
        mobileLarge: 4,
        tablet: 3,
        desktop: 4,
      ),
    );
    return SizedBox(
      width: double.infinity,
      height: ResponsiveSize.number(
        context: context,
        mobile: 120,
        mobileLarge: 150,
        tablet: 130,
        desktop: 300,
      ),
      child: Transform.rotate(
        angle: -0.06,
        child: Center(
          child: Container(
            height: ResponsiveSize.number(
              context: context,
              mobile: 60,
              mobileLarge: 70,
              tablet: 70,
              desktop: 120,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              border: DashedBorder(
                dashLength: 15,
                top: borderSide,
                bottom: borderSide,
              ),
            ),
            child: MarqueeList(
              scrollDirection: Axis.horizontal,
              scrollDuration: const Duration(seconds: 2),
              children: List.generate(
                growable: false,
                bannerTextList.length,
                (index) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: ResponsiveSize.number(
                          context: context,
                          mobile: 6,
                          mobileLarge: 7,
                          tablet: 6,
                          desktop: 10,
                        ),
                        backgroundColor: primaryColor,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveSize.number(
                            context: context,
                            mobile: 20,
                            mobileLarge: 20,
                            tablet: 10,
                            desktop: 20,
                          ),
                        ),
                        child: Text(
                          bannerTextList[index].toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveSize.number(
                              context: context,
                              mobile: 17,
                              mobileLarge: 20,
                              tablet: 20,
                              desktop: 40,
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
