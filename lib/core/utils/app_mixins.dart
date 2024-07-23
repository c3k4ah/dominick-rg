import 'package:flutter/material.dart';

mixin ScrollManagerMixin<T extends StatefulWidget> on State<T> {
  late ScrollController scrollController;
  int selectedItem = 0;
  late int itemCount;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  void scrollTo(int index, {double itemExtent = 140.0, Duration duration = const Duration(milliseconds: 500)}) {
    scrollController.animateTo(
      index.toDouble() * itemExtent,
      duration: duration,
      curve: Curves.fastOutSlowIn,
    );
  }

  void nextItem(bool hasController) {
    setState(() {
      selectedItem = (selectedItem + 1) % itemCount;
     if(hasController) scrollTo(selectedItem);
    });
  }

  void previousItem(bool hasController) {
    setState(() {
      selectedItem = (selectedItem - 1 + itemCount) % itemCount;
      if(hasController)  scrollTo(selectedItem);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
