import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../core/responsibility/responsive_behavior.dart';
import '../ui/ui_import.dart';
import '../widgets/widgets_import.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> widgetPartList = const [
    AboutPart(),
    BannerWidget(),
    ProjectPart(),
    ExperienceTimeline(),
    SkillsPart(),
    Column(
      children: [
        BigTitleWidget(
          title: "Awards",
          subtitle: "My rewards and achievements obtained during Hackathons.",
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
    FooterPart(),
  ];

  late AutoScrollController controller;
  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
  }

  Future _scrollToCounter(int index) async {
    await controller.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    controller.highlight(index);
  }

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
        onTapItem: (id) async {
          await _scrollToCounter(id);
          HomePage.scaffoldKey.currentState?.closeEndDrawer();
        },
        onCloseMenu: () => HomePage.scaffoldKey.currentState?.closeEndDrawer(),
      ),
      key: HomePage.scaffoldKey,
      backgroundColor: Colors.black,
      appBar: BlurAppBar(
        onTapItem: (id) async {
          await _scrollToCounter(id);
        },
        onTapMenu: () {
          HomePage.scaffoldKey.currentState?.openEndDrawer();
        },
      ),
      body: BackGroundPattern(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            controller: controller,
            children: List.generate(
              widgetPartList.length,
              (index) {
                return AutoScrollTag(
                  key: ValueKey(index),
                  controller: controller,
                  index: index,
                  child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      margin: EdgeInsets.symmetric(
                        horizontal: (index == widgetPartList.length - 1)
                            ? 0
                            : necessaryPadding,
                      ),
                      child: widgetPartList[index]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
