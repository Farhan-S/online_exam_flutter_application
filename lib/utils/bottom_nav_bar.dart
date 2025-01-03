import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';// Import the required package

class CustomBottomNavigationBar extends StatelessWidget {
  final NotchBottomBarController controller;
  final int maxCount;
  final List<Widget> bottomBarPages;
  final PageController pageController;

  const CustomBottomNavigationBar({
    super.key,
    required this.controller,
    required this.maxCount,
    required this.bottomBarPages,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    if (bottomBarPages.length > maxCount) {
      return const SizedBox(); // Return an empty widget if the condition is not met
    }

    return AnimatedNotchBottomBar(
      /// Provide NotchBottomBarController
      notchBottomBarController: controller,
      color: Colors.white,
      showLabel: true,
      textOverflow: TextOverflow.visible,
      maxLine: 1,
      shadowElevation: 4,
      kBottomRadius: 0,
      notchColor: Colors.white,
      removeMargins: true,
      bottomBarWidth: 500,
      showShadow: true,
      durationInMilliSeconds: 300,
      itemLabelStyle: const TextStyle(fontSize: 10),
      elevation: 9,
      showBlurBottomBar: true,
      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(
            Icons.home_outlined,
            color: Colors.blueGrey,
          ),
          activeItem: Icon(
            Icons.home_filled,
            color: Colors.black,
          ),
          itemLabel: 'Page 1',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.star, color: Colors.blueGrey),
          activeItem: Icon(
            Icons.star,
            color: Colors.black,
          ),
          itemLabel: 'Page 2',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.settings,
            color: Colors.blueGrey,
          ),
          activeItem: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          itemLabel: 'Page 3',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.person,
            color: Colors.blueGrey,
          ),
          activeItem: Icon(
            Icons.person,
            color: Colors.black,
          ),
          itemLabel: 'Page 4',
        ),
      ],
      onTap: (index) {
        log('current selected index $index');
        pageController.jumpToPage(index);
      },
      kIconSize: 24.0,
    );
  }
}
