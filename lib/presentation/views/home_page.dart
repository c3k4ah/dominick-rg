import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/responsibility/responsive_behavior.dart';
import '../ui/ui_import.dart';
import '../widgets/widgets_import.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ResponsiveBehavior responsiveBehavior = ResponsiveBehavior(context);
    double necessaryPadding = getNecessaryPadding(
      context: context,
      disable: responsiveBehavior.isTablet,
    );
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      endDrawer: AppDrawer(
        onCloseMenu: () => scaffoldKey.currentState?.closeEndDrawer(),
      ),
      key: scaffoldKey,
      backgroundColor: Colors.black,
      appBar: BlurAppBar(
        onTapMenu: () {
          scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      body: BackGroundPattern(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                // height: MediaQuery.sizeOf(context).height,
                margin: EdgeInsets.symmetric(
                  horizontal: necessaryPadding,
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AboutPart(),
                    BannerWidget(),
                    ProjectPart(),
                    ExperienceTimeline(),
                    SkillsPart(),
                    Column(
                      children: [
                        BigTitleWidget(
                          title: "HACKATHONS",
                          subtitle:
                              "Mes récompenses et succès obtenus lors des Hackathons.",
                        ),
                        ResponsiveLayout(
                          mobile: HackathonPartMobile(),
                          mobileLarge: HackathonPartMobile(),
                          tablet: HackathonPart(),
                          desktop: HackathonPart(),
                          largeDesktop: HackathonPart(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const FooterPart(),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: bottomAppBar(context, necessaryPadding),
    );
  }
}

Widget bottomAppBar(BuildContext context, double necessaryPadding) {
  return Container(
    height: 50,
    color: Colors.black.withOpacity(.4),
    child: Center(
      child: Text(
        'device:${getDevice(
          Size(
            MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height,
          ),
        )} | witdh:${MediaQuery.sizeOf(context).width} | height:${MediaQuery.sizeOf(context).height} | padding:$necessaryPadding',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    ),
  );
}
