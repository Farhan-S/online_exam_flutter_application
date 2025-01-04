import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sesh_prostuti/screens/home_screen.dart';

void main() {
  runApp( MyApp());

}

class MyApp extends StatelessWidget {
  final zoomDrawerController = ZoomDrawerController();
   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  ZoomDrawer(
        controller: zoomDrawerController,
        style: DrawerStyle.defaultStyle,
        menuScreen: MenuScreen (),
        mainScreen: HomeScreen(zoomDrawerController:zoomDrawerController),
        borderRadius: 24.0,
        showShadow: true,
        mainScreenTapClose: true,
        angle: 9.0,
        menuBackgroundColor: Colors.white,
        drawerShadowsBackgroundColor: Colors.grey[300]??Colors.grey,
        slideWidth: MediaQuery.of(context).size.width*.75,
        openCurve: Curves.fastOutSlowIn,
        closeCurve: Curves.bounceIn,
      ),
    );
  }


}


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0; // Track the selected menu item

  // Menu options
  final List<Map<String, dynamic>> _menuItems = [
    {"title": "Home", "icon": Icons.home},
    {"title": "Settings", "icon": Icons.settings},
    {"title": "About", "icon": Icons.info},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color for the menu
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('lib/assets/Avatar.png'), // Replace with your asset
                  ),
                  SizedBox(height: 10),
                  Text(
                    "John Doe", // User name
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "john.doe@example.com", // User email
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey), // Divider below the header
            const SizedBox(height: 20),
            // Menu Items
            ..._menuItems.asMap().entries.map((entry) {
              int index = entry.key;
              Map<String, dynamic> item = entry.value;

              return ListTile(
                leading: Icon(
                  item["icon"],
                  color: _selectedIndex == index ? Colors.black87 : Colors.grey,
                ),
                title: Text(
                  item["title"],
                  style: TextStyle(
                    color: _selectedIndex == index ? Colors.black87 : Colors.grey,
                    fontSize: 16,
                    fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedIndex = index; // Update the selected index
                  });

                  // Add navigation logic for other menu items
                  Navigator.of(context).pop(); // Close drawer if needed
                },
              );
            }).toList(),
            const Spacer(),
            // Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  // Handle logout logic here
                  Navigator.of(context).pop(); // Close drawer
                },
              ),
            ),
            const SizedBox(height: 20), // Space below the logout button
          ],
        ),
      ),
    );
  }
}
