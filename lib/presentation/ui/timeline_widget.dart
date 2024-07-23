import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:web_portfolio/core/constants/colors.dart';

import '../../core/responsibility/responsive_behavior.dart';
import '../../data/experience_data.dart';
import '../../shared/formation_model.dart';
import '../widgets/big_title_widget.dart';

class ExperienceTimeline extends StatelessWidget {
  const ExperienceTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    ResponsiveSize.number(
      context: context,
      mobile: 250,
      mobileLarge: 350,
      tablet: 260,
      desktop: 200,
      largeDesktop: 310,
    );
    return SizedBox(
      height: 4.5 *
          ResponsiveSize.number(
            context: context,
            mobile: 250,
            mobileLarge: 350,
            tablet: 260,
            desktop: 200,
            largeDesktop: 310,
          ),
      width: double.infinity,
      child: Column(
        children: [
          const BigTitleWidget(
            title: "Experiences",
            subtitle:
                "Mon expérience professionnelle, au cours desquelles j'ai eu l'opportunité de travailler avec divers entreprises.",
          ),
          SizedBox(
            height: 4 *
                ResponsiveSize.number(
                  context: context,
                  mobile: 250,
                  mobileLarge: 350,
                  tablet: 250,
                  desktop: 175,
                  largeDesktop: 300,
                ),
            child: CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: <Widget>[_TimelineSteps(exps: experienceList)],
            ),
          ),
        ],
      ),
    );
  }
}

class _TimelineSteps extends StatelessWidget {
  const _TimelineSteps({Key? key, required this.exps}) : super(key: key);

  final List<ExpsModel> exps;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index.isOdd) {
            return const TimelineDivider(
              color: primaryColor,
              thickness: 4,
              begin: 0.1,
              end: 0.9,
            );
          }

          final int itemIndex = index ~/ 2;
          final ExpsModel experience = exps[itemIndex];

          final bool isLeftAlign = itemIndex.isEven;

          final child = _TimelineStepsChild(
            title: '${experience.institut} (${experience.title})',
            subtitle: experience.projects.map(
              (e) {
                return e.tasks?.join(' -- ');
              },
            ).join(' -- '),
            isLeftAlign: isLeftAlign,
          );

          final isFirst = itemIndex == 0;
          final isLast = itemIndex == exps.length - 1;
          double indicatorY;
          if (isFirst) {
            indicatorY = 0.2;
          } else if (isLast) {
            indicatorY = 0.8;
          } else {
            indicatorY = 0.5;
          }

          return TimelineTile(
            axis: TimelineAxis.vertical,
            alignment: TimelineAlign.manual,
            endChild: isLeftAlign ? child : null,
            startChild: isLeftAlign ? null : child,
            lineXY: isLeftAlign ? 0.1 : 0.9,
            isFirst: isFirst,
            isLast: isLast,
            indicatorStyle: IndicatorStyle(
              width: ResponsiveSize.number(
                context: context,
                mobile: 70,
                mobileLarge: 100,
                tablet: 100,
                desktop: 100,
              ),
              height: ResponsiveSize.number(
                context: context,
                mobile: 40,
                mobileLarge: 50,
                tablet: 50,
                desktop: 50,
              ),
              indicatorXY: indicatorY,
              indicator: _TimelineStepIndicator(
                step: experience.date,
              ),
            ),
            beforeLineStyle: const LineStyle(
              color: primaryColor,
              thickness: 4,
            ),
          );
        },
        childCount: max(0, exps.length * 2 - 1),
      ),
    );
  }
}

class _TimelineStepIndicator extends StatelessWidget {
  const _TimelineStepIndicator({Key? key, required this.step})
      : super(key: key);

  final String step;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryColor,
      ),
      child: Center(
        child: Text(
          step,
          style: GoogleFonts.sourceCodePro(
            fontSize: ResponsiveSize.number(
              context: context,
              mobile: 15,
              mobileLarge: 30,
              tablet: 25,
              desktop: 25,
            ),
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _TimelineStepsChild extends StatelessWidget {
  const _TimelineStepsChild({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isLeftAlign,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final bool isLeftAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      height: ResponsiveSize.number(
        context: context,
        mobile: 250,
        mobileLarge: 350,
        tablet: 250,
        desktop: 170,
        largeDesktop: 300,
      ),
      padding: isLeftAlign
          ? const EdgeInsets.only(right: 32, top: 16, bottom: 16, left: 10)
          : const EdgeInsets.only(left: 32, top: 16, bottom: 16, right: 10),
      child: Column(
        crossAxisAlignment:
            isLeftAlign ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: GoogleFonts.sourceCodePro(
              fontSize: ResponsiveSize.number(
                context: context,
                mobile: 15,
                mobileLarge: 20,
                tablet: 25,
                desktop: 25,
              ),
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: isLeftAlign ? TextAlign.right : TextAlign.left,
            style: GoogleFonts.sourceCodePro(
              fontSize: ResponsiveSize.number(
                context: context,
                mobile: 10,
                mobileLarge: 15,
                tablet: 15,
                desktop: 13,
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
