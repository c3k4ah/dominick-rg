import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';
import '../../core/utils/default_img_loading.dart';
import '../../core/utils/url_navigate.dart';
import '../../data/data.dart';
import '../widgets/big_title_widget.dart';
import '../../shared/project_model.dart';

class ProjectPart extends StatelessWidget {
  const ProjectPart({super.key});

  double _getResponsiveWidth(BuildContext context) {
    return ResponsiveSize.number(
      context: context,
      mobile: 1,
      mobileLarge: 1,
      tablet: .5,
      desktop: .5,
    );
  }

  double _getResponsiveHeight(BuildContext context) {
    return ResponsiveSize.number(
      context: context,
      mobile: 140,
      mobileLarge: 200,
      tablet: 200,
      desktop: 250,
      largeDesktop: 300,
    );
  }

  double _getResponsiveListLength(BuildContext context, int length) {
    return ResponsiveSize.number(
      context: context,
      mobile: length / 1.4,
      mobileLarge: length / 1.5,
      tablet: length / 2,
      desktop: length / 2.5,
      largeDesktop: length / 3,
    );
  }

  double _getResponsiveSpacing(BuildContext context) {
    return ResponsiveSize.number(
      context: context,
      mobile: 80,
      mobileLarge: 120,
      tablet: 50,
      desktop: 50,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size boxSize = Size(
      _getResponsiveWidth(context),
      _getResponsiveHeight(context),
    );
    double listH = _getResponsiveListLength(context, projectList.length) *
        (boxSize.height + _getResponsiveSpacing(context));

    return Container(
      height: listH,
      // color: Colors.red,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveSize.number(
          context: context,
          mobile: 1,
          mobileLarge: 20,
          tablet: 20,
          desktop: 20,
        ),
      ),
      child: Column(
        children: [
          const BigTitleWidget(
            title: "My projects",
            subtitle: "My personal projects that demonstrate my knowledge.",
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: ResponsiveSize.number(
                  context: context,
                  mobile: 1,
                  mobileLarge: 1,
                  tablet: 2,
                  desktop: 2,
                ).toInt(),
                childAspectRatio: (MediaQuery.sizeOf(context).width *
                    boxSize.width /
                    boxSize.height),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List.generate(
                  projectList.length,
                  (index) {
                    ProjectModel project = projectList[index];
                    return Container(
                      margin: const EdgeInsets.all(5),
                      // height: 50,
                      // color: Colors.grey.shade100,
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              bottom: 20,
                              right: 10,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                ResponsiveSize.number(
                                  context: context,
                                  mobile: 13,
                                  mobileLarge: 20,
                                  tablet: 20,
                                  desktop: 20,
                                ),
                              ),
                              child: SizedBox(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 10.0,
                                    sigmaY: 10.0,
                                  ),
                                  child: Container(
                                    color: Colors.white.withOpacity(0.1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: Colors.transparent,
                                  padding: const EdgeInsets.all(15)
                                      .copyWith(right: 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        project.title,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: primaryColor,
                                          fontSize: ResponsiveSize.number(
                                            context: context,
                                            mobile: 15,
                                            mobileLarge: 30,
                                            tablet: 25,
                                            desktop: 25,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        project.description,
                                        maxLines: 4,
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                          fontSize: ResponsiveSize.number(
                                            context: context,
                                            mobile: 10,
                                            mobileLarge: 15,
                                            tablet: 15,
                                            desktop: 13,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: double.infinity,
                                width: ResponsiveSize.number(
                                  context: context,
                                  mobile: 50,
                                  mobileLarge: 70,
                                  tablet: 70,
                                  desktop: 80,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          launchMyUrl(project.urlProject),
                                      child: Container(
                                        height: ResponsiveSize.number(
                                          context: context,
                                          mobile: 35,
                                          mobileLarge: 50,
                                          tablet: 50,
                                          desktop: 50,
                                        ),
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            ResponsiveSize.number(
                                              context: context,
                                              mobile: 10,
                                              mobileLarge: 13,
                                              tablet: 13,
                                              desktop: 13,
                                            ),
                                          ),
                                        ),
                                        child: SvgWidgetPlaceholder(
                                          asset:
                                              'assets/icons/${project.type}.svg',
                                          fit: BoxFit.fitHeight,
                                          colorFilter: const ColorFilter.mode(
                                              Colors.black, BlendMode.srcIn),
                                          height:
                                              MediaQuery.sizeOf(context).height,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
