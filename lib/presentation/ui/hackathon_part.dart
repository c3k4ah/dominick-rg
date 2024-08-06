import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/constants/colors.dart';
import '../../core/responsibility/responsive_behavior.dart';
import '../../core/utils/app_mixins.dart';
import '../../core/utils/default_img_loading.dart';
import '../../core/utils/url_navigate.dart';
import '../../data/data.dart';
import '../widgets/blur_container.dart';
import '../widgets/button_widget.dart';

class HackathonPart extends StatefulWidget {
  const HackathonPart({Key? key}) : super(key: key);

  @override
  State<HackathonPart> createState() => _HackathonPartState();
}

class _HackathonPartState extends State<HackathonPart> {
  final ScrollController _scrollController = ScrollController();
  int _selectedPhoto = 0;

  void _scrollTo(int index) {
    _scrollController.animateTo(
      index.toDouble() * 140,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _next() {
    setState(() {
      _selectedPhoto = (_selectedPhoto + 1) % awardsList.length;
      _scrollTo(_selectedPhoto);
    });
  }

  void _previous() {
    setState(() {
      _selectedPhoto =
          (_selectedPhoto - 1 + awardsList.length) % awardsList.length;
      _scrollTo(_selectedPhoto);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double padding = ResponsiveSize.number(
      context: context,
      mobile: 10,
      mobileLarge: 20,
      tablet: 50,
      desktop: 150,
      largeDesktop: 70,
    );

    final double containerHeight = ResponsiveSize.number(
      context: context,
      mobile: 700,
      mobileLarge: 700,
      tablet: 600,
      desktop: 500,
      largeDesktop: 800,
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      height: containerHeight,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              children: [
                _buildBackdropBlurContainer(context),
                _buildMainContent(context),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          _buildThumbnailCarousel(),
        ],
      ),
    );
  }

  Widget _buildBackdropBlurContainer(BuildContext context) {
    final double blurContainerWidth = ResponsiveSize.number(
      context: context,
      mobile: 600,
      mobileLarge: 600,
      tablet: 600,
      desktop: MediaQuery.sizeOf(context).width * .9,
    );

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: BlurContainer(
              width: blurContainerWidth,
              height: double.infinity,
              radius: BorderRadius.circular(25),
              child: const SizedBox(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.sizeOf(context).width * .1,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height,
      child: Row(
        children: [
          _buildSidebar(context),
          _buildMainImage(),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    ResponsiveSize.number(
      context: context,
      mobile: 35,
      mobileLarge: 40,
      tablet: 50,
      desktop: 45,
    );

    ResponsiveSize.number(
      context: context,
      mobile: 160,
      mobileLarge: 180,
      tablet: 300,
      desktop: 250,
    );

    ResponsiveSize.number(
      context: context,
      mobile: 10,
      mobileLarge: 15,
      tablet: 17,
      desktop: 17,
    );

    return Container(
      color: Colors.transparent,
      width: 300,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          _buildInstitutionLogo(context),
          Expanded(
            child: _buildPhotoDetails(context),
          ),
          ButtonWidget(
            color: primaryColor,
            text: 'View the post',
            onPressed: () => launchMyUrl(awardsList[_selectedPhoto].urlPost),
          ),
        ],
      ),
    );
  }

  Widget _buildInstitutionLogo(BuildContext context) {
    return ResponsiveLayout(
      mobile: const SizedBox.shrink(),
      mobileLarge: const SizedBox.shrink(),
      largeDesktop: _logoImage(context),
      tablet: _logoImage(context),
      desktop: _logoImage(context),
    );
  }

  Widget _logoImage(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Center(
        child: ImageWidgetPlaceholder(
          fit: BoxFit.fitHeight,
          image: ExactAssetImage(
            awardsList[_selectedPhoto].institutLogo,
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoDetails(BuildContext context) {
    final double rankFontSize = ResponsiveSize.number(
      context: context,
      mobile: 10,
      mobileLarge: 15,
      tablet: 25,
      desktop: 35,
    );

    final double descriptionFontSize = ResponsiveSize.number(
      context: context,
      mobile: 10,
      mobileLarge: 15,
      tablet: 17,
      desktop: 15,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          awardsList[_selectedPhoto].rank,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: rankFontSize,
          ),
        ),
        Text(
          awardsList[_selectedPhoto].description,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: descriptionFontSize,
          ),
        ),
      ],
    );
  }

  Widget _buildMainImage() {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 5, color: Colors.white),
          ),
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ImageWidgetPlaceholder(
              fit: BoxFit.cover,
              image: ExactAssetImage(
                awardsList[_selectedPhoto].urlImage,
              ),
            ),
          )),
    );
  }

  Widget _buildThumbnailCarousel() {
    return SizedBox(
      height: ResponsiveSize.number(
        context: context,
        mobile: 60,
        mobileLarge: 60,
        tablet: 160,
        desktop: 80,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildThumbnailList(),
          _buildNavigationArrows(),
        ],
      ),
    );
  }

  Widget _buildThumbnailList() {
    return Container(
      height: 100,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: awardsList.length,
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final palmares = awardsList[index];
          return InkWell(
            onTap: () {
              setState(() {
                _selectedPhoto = index;
              });
            },
            child: Container(
              width: 100,
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: index == _selectedPhoto
                    ? Border.all(width: 5, color: primaryColor)
                    : null,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ImageWidgetPlaceholder(
                  fit: BoxFit.cover,
                  image: ExactAssetImage(
                    palmares.urlImage,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavigationArrows() {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNavigateButton(Icons.arrow_back_ios, _previous),
          _buildNavigateButton(Icons.arrow_forward_ios, _next),
        ],
      ),
    );
  }

  Widget _buildNavigateButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.8),
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, size: 20),
      ),
    );
  }
}

Widget navigateWidget({
  required Function() onTap,
  required IconData icon,
  required BuildContext context,
}) {
  double size = ResponsiveSize.number(
    context: context,
    mobile: 50,
    mobileLarge: 50,
    tablet: 50,
    desktop: 50,
    largeDesktop: 50,
  );
  return InkWell(
    onTap: onTap,
    child: Container(
      height: size,
      width: size,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.black,
          size: 20,
        ),
      ),
    ),
  );
}

class HackathonPartMobile extends StatefulWidget {
  const HackathonPartMobile({super.key});

  @override
  State<HackathonPartMobile> createState() => _HackathonPartMobileState();
}

class _HackathonPartMobileState extends State<HackathonPartMobile>
    with ScrollManagerMixin<HackathonPartMobile> {
  @override
  void initState() {
    super.initState();
    itemCount = awardsList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveSize.number(
          context: context,
          mobile: 0,
          mobileLarge: 10,
          tablet: 780,
          desktop: 950,
          largeDesktop: 950,
        ),
      ),
      height: ResponsiveSize.number(
        context: context,
        mobile: 350,
        mobileLarge: 450,
        tablet: 780,
        desktop: 950,
        largeDesktop: 950,
      ),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          BlurContainer(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            radius: BorderRadius.circular(25),
            width: ResponsiveSize.number(
              context: context,
              mobile: 600,
              mobileLarge: 600,
              tablet: 600,
              desktop: MediaQuery.sizeOf(context).width * .9,
            ),
            padding: EdgeInsets.all(
              ResponsiveSize.number(
                context: context,
                mobile: 30,
                mobileLarge: 30,
                tablet: 50,
                desktop: 50,
              ),
            ),
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 80,
                  child: Center(
                    child: ImageWidgetPlaceholder(
                      fit: BoxFit.fitHeight,
                      image: ExactAssetImage(
                        awardsList[selectedItem].institutLogo,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        awardsList[selectedItem].rank,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: ResponsiveSize.number(
                            context: context,
                            mobile: 25,
                            mobileLarge: 35,
                            tablet: 20,
                            desktop: 35,
                          ),
                        ),
                      ),
                      Text(
                        awardsList[selectedItem].description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: ResponsiveSize.number(
                            context: context,
                            mobile: 15,
                            mobileLarge: 20,
                            tablet: 17,
                            desktop: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ButtonWidget(
                  color: primaryColor,
                  text: 'View the post',
                  onPressed: () =>
                      launchMyUrl(awardsList[selectedItem].urlPost),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 130,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navigateWidget(
                  icon: Icons.arrow_back_ios,
                  onTap: () => previousItem(false),
                  context: context,
                ),
                navigateWidget(
                  icon: Icons.arrow_forward_ios,
                  onTap: () => nextItem(false),
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
