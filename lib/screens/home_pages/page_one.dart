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
  const Page1({Key? key, this.controller, required this.zoomDrawerController}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();

}

class _Page1State extends State<Page1> {

  Color _navbarColor = Colors.transparent;
  final List<Color> _carouselColors = [
    Colors.red[200] ?? Colors.red,
    Colors.blue[200] ?? Colors.blue,
    Colors.green[200] ?? Colors.green,
    Colors.orange[200] ?? Colors.orange,
  ];
  int _currentIndex = 0;
  bool _isVerticalScroll = false; // Track if vertical scroll is happening
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
            NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification) {
                  // Check if it's vertical scrolling
                  if (scrollNotification.metrics.axis == Axis.vertical) {
                    setState(() {
                      _isVerticalScroll = true;
                      // Change navbar color only if scrolled vertically
                      if (scrollNotification.metrics.pixels > 50) {
                        _navbarColor = _carouselColors[_currentIndex];
                      } else {
                        _navbarColor = Colors.transparent;
                        _isVerticalScroll = false;
                      }
                    });
                  }
                }
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Carousel
                    Container(
                      height: 250,
                      width: double.infinity,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 250.0,
                          viewportFraction: 1.0,
                          autoPlay: !_isVerticalScroll,
                          autoPlayInterval: Duration(seconds: 10),
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;

                            });

                            // Change status bar color
                            SystemChrome.setSystemUIOverlayStyle(
                              SystemUiOverlayStyle(
                                statusBarColor: _carouselColors[index],
                                statusBarIconBrightness: Brightness.light,
                              ),
                            );
                          },
                        ),
                        items: [
                          'lib/assets/c_1.jpg',
                          'lib/assets/c_2.jpg',
                          'lib/assets/c_3.png',
                          'lib/assets/c_4.png',
                        ].map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(imageUrl),
                                    fit: BoxFit.fill,
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
            ),
            // Fixed Navbar
            Container(
              color: _navbarColor, // Dynamic navbar color
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white),
                    onPressed: () {
                      // Handle menu action
                      widget.zoomDrawerController.toggle?.call();

                    },
                  ),
                  Text(
                    'Sesh Prostuti',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('lib/assets/Avatar.png'),
                    ),
                    onPressed: () {
                      // Handle profile action
                    },
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