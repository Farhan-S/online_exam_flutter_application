import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/src/drawer_controller.dart';
import 'package:sesh_prostuti/utils/light_colors.dart';
import 'package:sesh_prostuti/widgets/grid_item.dart';
import 'package:sesh_prostuti/widgets/list_new_exam.dart';

/// add controller to check weather index through change or not. in page 1
class Page1 extends StatefulWidget {
  final NotchBottomBarController? controller;
  final ZoomDrawerController zoomDrawerController;
  final ValueNotifier<Color> navbarColorNotifier; // Pass the ValueNotifier
  const Page1({
    super.key,
    this.controller,
    required this.zoomDrawerController,
    required this.navbarColorNotifier,

  });

  @override
  _Page1State createState() => _Page1State();

}

class _Page1State extends State<Page1> {

  final List<Color> _carouselColors = [

    Color.fromRGBO(52, 10, 51, 1) ,
    Color.fromRGBO(140, 45, 0, 1),
    Color.fromRGBO(201, 98, 14, 1),
    Color.fromRGBO(53, 0, 0, 1),
    Color.fromRGBO(38, 26, 23, 1),




  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100]
      ),
      child: SafeArea(
        child: Stack(
          children: [
            // Scrollable content (Carousel and below)
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Carousel
                  Container(

                    width: double.infinity,
                    child: CarouselSlider(
                      options: CarouselOptions(

                        viewportFraction: 1.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 10),
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() {
                            // Update the navbar color using ValueNotifier
                            widget.navbarColorNotifier.value = _carouselColors[index];


                          });


                          // Change status bar color
                          SystemChrome.setSystemUIOverlayStyle(
                            SystemUiOverlayStyle(
                              statusBarColor: _carouselColors[index],
                              statusBarIconBrightness: Brightness.light,
                              systemNavigationBarColor: _carouselColors[index],

                            ),
                          );
                        },
                      ),
                      items: [
                        'lib/assets/1.png',
                        'lib/assets/2.png',
                        'lib/assets/3.png',
                        'lib/assets/4.png',
                        'lib/assets/5.png',
                      ].map((imageUrl) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imageUrl),
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  // Content below carousel
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of items in a row
                          crossAxisSpacing: 5, // Horizontal spacing
                          mainAxisSpacing: 5, // Vertical spacing
                          childAspectRatio: .9
                      ),
                      shrinkWrap: true, // Avoids infinite height error
                      physics: NeverScrollableScrollPhysics(), // Grid won't scroll independently
                      itemCount: 6, // Number of items
                      itemBuilder: (context, index) {
                        return GridItem(
                          itemName: ItemName.itemNames[index],
                          iconPath: "lib/assets/test-exam.svg",
                          backgroundColor: LightColors.colors[index],
                        );
                      },
                    ),


                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Our New Live exams",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        ),Text("See all",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500
                        )
                          ,),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16),
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.transparent,

                      ),
                      child: SvgPicture.asset(
                        "lib/assets/Card.svg", // Correct way to load asset SVGs
                        width: MediaQuery.of(context).size.width,
                      ),

                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Explore our new features",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 300, // Constrain height for horizontal ListView.builder
                        child: ListView.builder(
                          itemCount: 5, // Number of horizontal items
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return ListNewFeatureItem(
                              title: "Feature $index",
                              items: ["1", "2", "3", "4", "5", "6", "7", "8", "9"],
                            );
                          },
                        ),
                      ),


                    ],
                  ),

                ],
              ),

            ),

          ],
        ),
      ),

    );
  }

}

class ItemName{
 static List<String> itemNames = [
   "বিসিএস পরীক্ষা","সরকারি প্রাথমিক", "বিষয়ভিত্তিক প্রস্তুতি","ব্যাংক জব","বিশ্ববিদ্যালয় ভর্তি প্রস্তুতি", "এসএসসি পরীক্ষা"

  ];
}
class ItemIcons{
  static List<String> itemIcons = [
    "lib/assets/test-exam.svg","lib/assets/school.svg", "lib/assets/book.svg","lib/assets/bank.svg", "lib/assets/university.svg", "lib/assets/ssc.svg"

  ];
}