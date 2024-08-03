import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageWidgetPlaceholder extends StatelessWidget {
  const ImageWidgetPlaceholder({
    super.key,
    required this.image,
    required this.fit,
  });
  final ImageProvider image;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Image(
      height: double.infinity,
      width: double.infinity,
      image: image,
      fit: fit,
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool? wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded == true) {
          return child;
        } else {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: frame != null
                ? child
                : Container(color: Colors.white.withOpacity(.1)),
          );
        }
      },
    );
  }
}

class SvgWidgetPlaceholder extends StatelessWidget {
  const SvgWidgetPlaceholder({
    super.key,
    required this.asset,
    required this.fit,
    this.colorFilter,
    this.width,
    this.height,
  });
  final String asset;
  final BoxFit fit;
  final ColorFilter? colorFilter;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SvgPicture(
      SvgAssetLoader(asset),
      placeholderBuilder: (BuildContext context) =>
          Container(color: Colors.white.withOpacity(.1)),
      fit: fit,
      colorFilter: colorFilter,
      width: width,
      height: height,
    );
  }
}
