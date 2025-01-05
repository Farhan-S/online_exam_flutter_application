import 'package:flutter/material.dart';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_zoom_drawer/src/drawer_controller.dart';
import 'package:sesh_prostuti/screens/home_pages/page_one.dart';
import 'package:sesh_prostuti/utils/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  final ZoomDrawerController zoomDrawerController;
  const HomeScreen({
    super.key,
    required this.zoomDrawerController,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// ValueNotifier for Navbar Color
  final ValueNotifier<Color> _navbarColorNotifier = ValueNotifier<Color>(Color.fromRGBO(52, 10, 51, 1));


  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller = NotchBottomBarController(index: 0);

  final List<Color> _darkColors = [
    Color.fromRGBO(38, 26, 23, 1),
    Color.fromRGBO(52, 10, 51, 1),
    Color.fromRGBO(53, 0, 0, 1),
  ];
  /// Determine if the navbar color is dark
  bool get isNavbarDark => _darkColors.contains(_navbarColorNotifier.value);
  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    _navbarColorNotifier.dispose();
    super.dispose();
  }
//end notched navigation bar

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      Page1(
        zoomDrawerController:widget.zoomDrawerController,
        controller: (_controller),
        navbarColorNotifier: _navbarColorNotifier,
      ),
      const Page2(),
      const Page3(),
      const Page4(),
      const Page5(),
    ];
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: ValueListenableBuilder<Color>(
          valueListenable: _navbarColorNotifier,
          builder: (context, color, child) {
            final textColor = isNavbarDark ? Colors.white : Colors.black;
            final iconColor = isNavbarDark ? Colors.white : Colors.black;

            return AppBar(
              backgroundColor: color, // Dynamically updated color
              elevation: 0,
              title:  Center(child: Text('Sesh Prostuti',style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor
              ),)),
              leading: IconButton(
                icon: Icon(Icons.menu,color: iconColor,),
                onPressed: () {
                  widget.zoomDrawerController.toggle?.call();
                },
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    icon: const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('lib/assets/Avatar.png'),
                    ),
                    onPressed: () {
                      // Handle profile action
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNavigationBar(
        controller: _controller,
        maxCount: maxCount,
        bottomBarPages: bottomBarPages,
        pageController: _pageController,
      ),
    );
  }
}


class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.lightGreenAccent, child: const Center(child: Text('Page 5')));
  }
}


