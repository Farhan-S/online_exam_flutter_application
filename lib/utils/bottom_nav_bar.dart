import 'dart:developer';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';// Import the required package

class CustomBottomNavigationBar extends StatelessWidget {
  final NotchBottomBarController controller;
  final int maxCount;
  final List<Widget> bottomBarPages;
  final PageController pageController;
  final Color textColor;
  final Color iconColor;
  final Color color;

  const CustomBottomNavigationBar({
    super.key,
    required this.controller,
    required this.maxCount,
    required this.bottomBarPages,
    required this.pageController,
    required this. textColor,
    required this.iconColor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (bottomBarPages.length > maxCount) {
      return const SizedBox(); // Return an empty widget if the condition is not met
    }

    return AnimatedNotchBottomBar(
      /// Provide NotchBottomBarController
      notchBottomBarController: controller,
      color: color,
      showLabel: true,
      textOverflow: TextOverflow.visible,
      maxLine: 1,
      shadowElevation: 4,
      kBottomRadius: 0,
      notchColor: color,
      removeMargins: true,
      bottomBarWidth: 500,
      showShadow: true,
      durationInMilliSeconds: 300,
      itemLabelStyle: TextStyle(fontSize: 10,color: Colors.white),
      elevation: 9,
      showBlurBottomBar: false,
      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.home_filled,
            color: Colors.white,
          ),
          itemLabel: 'Page 1',
        ),
        BottomBarItem(
          inActiveItem: Icon(Icons.star, color: Colors.white),
          activeItem: Icon(
            Icons.star,
            color: Colors.white,
          ),
          itemLabel: 'Page 2',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          itemLabel: 'Page 3',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.person,
            color: Colors.white,
          ),
          activeItem: Icon(
            Icons.person,
            color: Colors.white,
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
