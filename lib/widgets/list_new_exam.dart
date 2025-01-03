import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListNewFeatureItem extends StatelessWidget {
  final String title; // Title above the horizontal scroll view
  final List<String> items; // List of items for the scroll view

  const ListNewFeatureItem({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        width: 250,


        decoration:BoxDecoration(
          color: Colors.white,
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                "lib/assets/Card.svg", // Correct way to load asset SVGs
                width: MediaQuery.of(context).size.width,
              ),
              Text(
                'Best Practices for Success',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Text("10 free model tests\n10 live test\nAnswer with description",
                style:
                TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
