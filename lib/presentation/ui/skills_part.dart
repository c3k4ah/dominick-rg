import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';
import '../../core/utils/default_img_loading.dart';
import '../../data/skills_data.dart';
import '../../shared/skill_model.dart';
import '../widgets/big_title_widget.dart';

class SkillsPart extends StatelessWidget {
  const SkillsPart({super.key});
  double _getResponsiveWidth(BuildContext context) {
    return ResponsiveSize.number(
      context: context,
      mobile: .4,
      mobileLarge: .8,
      tablet: .4,
      desktop: .3,
      largeDesktop: .25,
    );
  }

  double _getResponsiveHeight(BuildContext context) {
    return ResponsiveSize.number(
      context: context,
      mobile: 150,
      mobileLarge: 380,
      tablet: 200,
      desktop: 250,
      largeDesktop: 300,
    );
  }

  double _getResponsiveListLength(BuildContext context, int length) {
    return ResponsiveSize.number(
      context: context,
      mobile: length / 7,
      mobileLarge: length / 6.5,
      tablet: length / 3.56,
      desktop: length / 5,
      largeDesktop: length / 5,
    );
  }

  double _getResponsiveSpacing(BuildContext context) {
    return ResponsiveSize.number(
      context: context,
      mobile: 150,
      mobileLarge: 100,
      tablet: 50,
      desktop: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size boxSize = Size(
      _getResponsiveWidth(context),
      _getResponsiveHeight(context),
    );
    double listH = _getResponsiveListLength(context, skillList.length) *
        (boxSize.height + _getResponsiveSpacing(context));

    return Container(
      height: listH,
      // color: Colors.red,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveSize.number(
          context: context,
          mobile: 1,
          mobileLarge: 10,
          tablet: 60,
          desktop: 60,
        ),
      ),
      child: Column(
        children: [
          const BigTitleWidget(
            title: "Skills",
            subtitle: "My skills and development tools.",
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: ResponsiveSize.number(
                  context: context,
                  mobile: 4,
                  mobileLarge: 3,
                  tablet: 3,
                  desktop: 4,
                ).toInt(),
                childAspectRatio: (MediaQuery.sizeOf(context).width *
                    boxSize.width /
                    boxSize.height),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List.generate(
                  skillList.length,
                  (index) {
                    SkillModel skill = skillList[index];
                    return _buildSkillItem(context, skill);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(BuildContext context, SkillModel skill) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        ResponsiveSize.number(
          context: context,
          mobile: 10,
          mobileLarge: 15,
          tablet: 15,
          desktop: 15,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: ResponsiveSize.number(
                context: context,
                mobile: 10,
                mobileLarge: 20,
                tablet: 30,
                desktop: 20,
              ),
              vertical: ResponsiveSize.number(
                context: context,
                mobile: 10,
                mobileLarge: 15,
                tablet: 10,
                desktop: 10,
              ),
            ),
            // height: ResponsiveSize.number(
            //   context: context,
            //   mobile: 50,
            //   mobileLarge: 50,
            //   tablet: 50,
            //   desktop: 50,
            // ),
            padding: EdgeInsets.all(
              ResponsiveSize.number(
                context: context,
                mobile: 15,
                mobileLarge: 25,
                tablet: 20,
                desktop: 30,
              ),
            ),
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(
                  ResponsiveSize.number(
                    context: context,
                    mobile: 10,
                    mobileLarge: 15,
                    tablet: 15,
                    desktop: 15,
                  ),
                )),
            child: (skill.isPng ?? false) == false
                ? SvgWidgetPlaceholder(
                    asset: skill.asset,
                    fit: BoxFit.fitHeight,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                    height: MediaQuery.sizeOf(context).height,
                  )
                : SizedBox(
                    // height: MediaQuery.sizeOf(context).height,
                    width: MediaQuery.sizeOf(context).width,
                    child: Image.asset(
                      skill.asset,
                      fit: BoxFit.fitHeight,
                      color: Colors.black,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
          ),
          Positioned(
            top: ResponsiveSize.number(
              context: context,
              mobile: 10,
              mobileLarge: 15,
              tablet: 15,
              desktop: 15,
            ),
            right: ResponsiveSize.number(
              context: context,
              mobile: 20,
              mobileLarge: 30,
              tablet: 40,
              desktop: 30,
            ),
            child: Center(
              child: Text(
                "${skill.percent}%",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveSize.number(
                    context: context,
                    mobile: 10,
                    mobileLarge: 15,
                    tablet: 15,
                    desktop: 13,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
