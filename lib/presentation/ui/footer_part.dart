import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';
import '../../core/utils/default_img_loading.dart';
import '../../core/utils/url_navigate.dart';
import '../../data/social_media.dart';
import '../widgets/blur_container.dart';

class FooterPart extends StatelessWidget {
  const FooterPart({super.key});

  @override
  Widget build(BuildContext context) {
    final ResponsiveBehavior responsiveBehavior = ResponsiveBehavior(context);
    double necessaryPadding = getNecessaryPadding(
      context: context,
      disable: responsiveBehavior.isTablet,
    );

    return BlurContainer(
      height: ResponsiveSize.number(
        context: context,
        mobile: 300,
        mobileLarge: 350,
        tablet: 400,
        desktop: 450,
      ),
      margin: EdgeInsets.only(
        top: ResponsiveSize.number(
          context: context,
          mobile: 50,
          mobileLarge: 50,
          tablet: 50,
          desktop: 50,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: necessaryPadding,
      ),
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: ResponsiveSize.number(
          context: context,
          mobile: 10,
          mobileLarge: 20,
          tablet: 20,
          desktop: 20,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  socialMediaGroup(context),
                  contactInfo(context),
                ],
              ),
            ),
            copyRightText(context),
          ],
        ),
      ),
    );
  }

  Widget copyRightText(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const Divider(
            color: Colors.white,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          Text(
            '© 2024 - Dominick Randriamanantena Grégoire',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveSize.number(
                context: context,
                mobile: 10,
                mobileLarge: 15,
                tablet: 20,
                desktop: 20,
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget contactInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      // width: ResponsiveSize.number(
      //   context: context,
      //   mobile: 150,
      //   mobileLarge: 200,
      //   tablet: 150,
      //   desktop: 150,
      // ),
      height: ResponsiveSize.number(
        context: context,
        mobile: 100,
        mobileLarge: 120,
        tablet: 200,
        desktop: 200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'CONTACT',
            style: TextStyle(
              fontSize: ResponsiveSize.number(
                context: context,
                mobile: 25,
                mobileLarge: 30,
                tablet: 40,
                desktop: 40,
              ),
              color: primaryColor,
            ),
          ),
          // const SizedBox(height: 10),
          contactTextWidget(
            context,
            'dominick.randriamanantena@gmail',
          ),
          contactTextWidget(
            context,
            '+261 34 44 599 16',
          ),
          contactTextWidget(
            context,
            'Antananarivo, Madagascar',
          ),
        ],
      ),
    );
  }

  Widget contactTextWidget(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          fontSize: ResponsiveSize.number(
            context: context,
            mobile: 10,
            mobileLarge: 15,
            tablet: 20,
            desktop: 20,
          ),
          color: Colors.white,
        ),
      ),
    );
  }

  Widget socialMediaGroup(BuildContext context) {
    double containerSize = ResponsiveSize.number(
      context: context,
      mobile: 100,
      mobileLarge: 100,
      tablet: 140,
      desktop: 150,
    );
    double containerRadius = ResponsiveSize.number(
      context: context,
      mobile: 10,
      mobileLarge: 10,
      tablet: 15,
      desktop: 15,
    );
    return SizedBox(
      width: containerSize,
      height: containerSize,
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(
          reseauxListe.length,
          (index) {
            double size = ResponsiveSize.number(
              context: context,
              mobile: 25,
              mobileLarge: 25,
              tablet: 30,
              desktop: 35,
            );
            double marge = ResponsiveSize.number(
              context: context,
              mobile: 4,
              mobileLarge: 4,
              tablet: 5,
              desktop: 4,
            );
            return InkWell(
              onTap: () => launchMyUrl(reseauxListe[index].link),
              child: Container(
                width: size,
                height: size,
                margin: EdgeInsets.all(marge),
                padding: EdgeInsets.all(marge),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(containerRadius),
                  color: Colors.white,
                ),
                child: Center(
                  child: SvgWidgetPlaceholder(
                    asset: reseauxListe[index].icon,
                    fit: BoxFit.fitHeight,
                    width: size,
                    height: size,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
