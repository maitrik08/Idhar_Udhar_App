import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/profile/profile_screen.dart';
import 'package:idhar_udhar/features/ride/mainRide_screen.dart';
import 'delivery/maindelivery_screen.dart';
import 'home/home_screen.dart';

class MainLayout extends StatefulWidget {
  MainLayout({Key? key}) : super(key: key);

  // ✅ Create the global key here
  static final GlobalKey<_MainLayoutState> mainLayoutKey = GlobalKey<_MainLayoutState>();

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

int currentIndex = 0;

class _MainLayoutState extends State<MainLayout> {
  final List<Widget> _screens = [
    HomeScreen(),  // Pass nothing here
    RideScreen(),
    DeliveryScreen(),
    ProfileScreen(),
  ];

  void setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setIndex(index),
        backgroundColor: const Color(0xFF2F3E2F),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: [
          _buildNavItem("assets/images/icons/home.png", "Home", 0),
          _buildNavItem("assets/images/icons/ride.png", "Ride", 1),
          _buildNavItem("assets/images/icons/delivery.png", "Delivery", 2),
          _buildNavItem("assets/images/icons/profile.png", "Profile", 3),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String iconPath, String label, int index) {
    bool isSelected = currentIndex == index;

    return BottomNavigationBarItem(
      label: label,
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSelected ? 26 : 20,
        height: isSelected ? 26 : 20,
        child: Image.asset(
          iconPath,
          color: isSelected ? Colors.white : Colors.white54,
        ),
      ),
    );
  }
}
