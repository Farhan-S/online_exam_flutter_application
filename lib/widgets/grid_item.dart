import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridItem extends StatelessWidget {
  final String itemName;
  final String iconPath;
  final Color backgroundColor;

  const GridItem({
    super.key,
    required this.itemName,
    required this.iconPath,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width; // Get device width

    return Container(

      margin: const EdgeInsets.all(3), // Add margin between cards
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Shadow color
            blurRadius: 10, // Blur effect
            spreadRadius: 2, // Spread of shadow
            offset: const Offset(0, 5), // Offset for X and Y directions
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12, top: 6, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconPath, // The path to your PNG file
              // Adjust the size as needed
              height: 65,
              fit: BoxFit.contain, // Ensures the image scales properly
            ),
            Text(
              itemName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),

    );
  }
}
