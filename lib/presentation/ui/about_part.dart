import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';

import '../widgets/button_widget.dart';

class AboutPart extends StatelessWidget {
  const AboutPart({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveBehavior responsiveBehavior = ResponsiveBehavior(context);
    bool isNotMobile =
        (!responsiveBehavior.isMobile && !responsiveBehavior.isMobileLarge);
    EdgeInsets bodyPadding = EdgeInsets.symmetric(
      horizontal: ResponsiveSize.number(
        context: context,
        mobile: 10,
        mobileLarge: 10,
        tablet: 50,
        desktop: 10,
      ),
    );
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (isNotMobile) {
          return Container(
            padding: bodyPadding,
            // height: ResponsiveSize.number(
            //   context: context,
            //   mobile: 500,
            //   mobileLarge: 600,
            //   tablet: 500,
            //   desktop: 500,
            // ),
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: ResponsiveSize.number(
                      context: context,
                      mobile: 250,
                      mobileLarge: 350,
                      tablet: 350,
                      desktop: 450,
                    ),
                    width: MediaQuery.sizeOf(context).width * .4,
                    // color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DOMINICK',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveSize.number(
                              context: context,
                              mobile: 40,
                              mobileLarge: 60,
                              tablet: 60,
                              desktop: 80,
                            ),
                          ),
                        ),
                        Text(
                          'Randriamanantena Grégroire',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: ResponsiveSize.number(
                              context: context,
                              mobile: 20,
                              mobileLarge: 30,
                              tablet: 25,
                              desktop: 25,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Passionné du numérique, je veux non seulement être un utilisateur mais surtout un créateur. Je suis dynamique et toujours prêt à apprendre. Je suis un développeur Flutter.',
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.white,
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
                        const SizedBox(
                          height: 20,
                        ),
                        const ButtonWidget(
                          color: Colors.white,
                          text: 'Télecharger mon CV',
                        ),
                      ],
                    ),
                  ),
                ),
                // Expanded(flex: 1, child: SizedBox()),
                Container(
                  height: ResponsiveSize.number(
                    context: context,
                    mobile: 250,
                    mobileLarge: 350,
                    tablet: 250,
                    desktop: 350,
                  ),
                  width: ResponsiveSize.number(
                    context: context,
                    mobile: 250,
                    mobileLarge: 350,
                    tablet: 250,
                    desktop: 350,
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: ExactAssetImage(
                        'assets/images/photo.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container(
            padding: bodyPadding,
            // height: ResponsiveSize.number(
            //   context: context,
            //   mobile: 500,
            //   mobileLarge: 600,
            //   tablet: 500,
            //   desktop: 500,
            // ),
            // color: Colors.amber,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                Container(
                  height: ResponsiveSize.number(
                    context: context,
                    mobile: 200,
                    mobileLarge: 250,
                    tablet: 250,
                    desktop: 450,
                  ),
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      image: ExactAssetImage(
                        'assets/images/photo.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveSize.number(
                    context: context,
                    mobile: 250,
                    mobileLarge: 350,
                    tablet: 250,
                    desktop: 450,
                  ),
                  child: Column(
                    crossAxisAlignment: isNotMobile
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'DOMINICK',
                        textAlign:
                            isNotMobile ? TextAlign.end : TextAlign.center,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveSize.number(
                            context: context,
                            mobile: 40,
                            mobileLarge: 60,
                            tablet: 80,
                            desktop: 80,
                          ),
                        ),
                      ),
                      Text(
                        'Randriamanantena Grégroire',
                        textAlign:
                            isNotMobile ? TextAlign.end : TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveSize.number(
                            context: context,
                            mobile: 15,
                            mobileLarge: 30,
                            tablet: 40,
                            desktop: 40,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Passionné du numérique, je veux non seulement être un utilisateur mais surtout un créateur. Je suis dynamique et toujours prêt à apprendre. Je suis un développeur Flutter.',
                        textAlign:
                            isNotMobile ? TextAlign.end : TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: ResponsiveSize.number(
                            context: context,
                            mobile: 13,
                            mobileLarge: 15,
                            tablet: 20,
                            desktop: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: ResponsiveSize.number(
                          context: context,
                          mobile: 35,
                          mobileLarge: 40,
                          tablet: 60,
                          desktop: 60,
                        ),
                        width: ResponsiveSize.number(
                          context: context,
                          mobile: 160,
                          mobileLarge: 180,
                          tablet: 300,
                          desktop: 300,
                        ),
                        child: MaterialButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              ResponsiveSize.number(
                                context: context,
                                mobile: 10,
                                mobileLarge: 8,
                                tablet: 15,
                                desktop: 15,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Télecharger mon CV',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: ResponsiveSize.number(
                                context: context,
                                mobile: 10,
                                mobileLarge: 15,
                                tablet: 20,
                                desktop: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
