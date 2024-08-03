import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/url.dart';
import '../../core/responsibility/responsive_behavior.dart';

import '../../core/utils/default_img_loading.dart';
import '../../core/utils/url_navigate.dart';
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        myFullName(context, isNotMobile),
                        const SizedBox(height: 15),
                        aboutMe(context, isNotMobile),
                        const SizedBox(height: 20),
                        ButtonWidget(
                          color: Colors.white,
                          text: 'Download my resume',
                          onPressed: () => launchMyUrl(resumeUrl),
                        ),
                      ],
                    ),
                  ),
                ),
                // Expanded(flex: 1, child: SizedBox()),
                roundedImage(context, isNotMobile),
              ],
            ),
          );
        } else {
          return Container(
            padding: bodyPadding,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                roundedImage(context, isNotMobile),
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
                      myFullName(context, isNotMobile),
                      const SizedBox(
                        height: 20,
                      ),
                      aboutMe(context, isNotMobile),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonWidget(
                        color: Colors.white,
                        text: 'Download my resume',
                        onPressed: () => launchMyUrl(resumeUrl),
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

  Widget roundedImage(BuildContext context, bool isNotMobile) {
    // height: ResponsiveSize.number(
    //   context: context,
    //   mobile: 250,
    //   mobileLarge: 350,
    //   tablet: 250,
    //   desktop: 350,
    // ),
    // width: ResponsiveSize.number(
    // context: context,
    // mobile: 250,
    // mobileLarge: 350,
    // tablet: 250,
    // desktop: 350,
    // ),
    return Container(
      height: ResponsiveSize.number(
        context: context,
        mobile: 200,
        mobileLarge: 250,
        tablet: 250,
        desktop: 350,
      ),
      width: isNotMobile
          ? ResponsiveSize.number(
              context: context,
              mobile: 250,
              mobileLarge: 350,
              tablet: 250,
              desktop: 350,
            )
          : double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: const ImageWidgetPlaceholder(
        fit: BoxFit.fitHeight,
        image: ExactAssetImage(
          'assets/images/photo.png',
        ),
      ),
    );
  }

  Widget myFullName(BuildContext context, bool isNotMobile) {
    return Column(
      crossAxisAlignment:
          isNotMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
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
      ],
    );
  }

  Widget aboutMe(BuildContext context, bool isNotMobile) {
    return Text(
      'Passionate about digital technology, I am driven by the desire to create rather than just use it. Dynamic and eager to learn, I bring constant energy to every project. Originally from Mahanoro and currently based in Tananarive, I leverage my diverse experiences to enrich my skills and professional perspectives.',
      maxLines: isNotMobile ? 5 : 10,
      textAlign: isNotMobile ? TextAlign.start : TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: ResponsiveSize.number(
          context: context,
          mobile: 10,
          mobileLarge: 13,
          tablet: 13,
          desktop: 13,
        ),
      ),
    );
  }
}
