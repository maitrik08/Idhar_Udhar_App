import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/profile/profile_screen.dart';
import 'package:idhar_udhar/features/ride/mainRide_screen.dart';
import 'delivery/maindelivery_screen.dart';
import 'home/home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    RideScreen(),
    DeliveryScreen(),
    ProfileScreen(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
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
      )


    );
  }
  BottomNavigationBarItem _buildNavItem(String iconPath, String label, int index) {
    bool isSelected = _currentIndex == index;

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
