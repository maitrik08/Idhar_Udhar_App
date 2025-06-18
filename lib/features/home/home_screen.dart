import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/delivery/maindelivery_screen.dart';
import '../../core/constants/constants.dart';
import '../mainlayout.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<bool> _visible = List.generate(10, (index) => false);

  @override
  void initState() {
    super.initState();
    _triggerAnimations();
  }

  void _triggerAnimations() async {
    for (int i = 0; i < _visible.length; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (mounted) {
        setState(() {
          _visible[i] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double sectionTitleFontSize = size.height * 0.0165;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAnimatedSection(
              0,
              _buildTopBar(size),
            ),
            const SizedBox(height: 20),
            _buildAnimatedSection(
              1,
              _buildSection('Ride in Comfort', sectionTitleFontSize, 'assets/images/home/car.png', () {
                Navigator.pushNamed(context, '/selectcarlocation');
                rideType = "car";
              }),
            ),
            const SizedBox(height: 16),
            _buildAnimatedSection(2, _buildBikeBagRow(size, sectionTitleFontSize)),
            const SizedBox(height: 16),
            _buildAnimatedSection(
              3,
              _buildSection("Hungry? We've Got You", sectionTitleFontSize, 'assets/images/home/burger.png', () {
                MainLayout.mainLayoutKey.currentState?.setIndex(2);
              }),
            ),
            const SizedBox(height: 16),
            _buildAnimatedSection(
              4,
              _buildSection('Deliver Anything, Anytime', sectionTitleFontSize, 'assets/images/home/delivery.png', () {
                Navigator.pushNamed(context, '/selectparceltype');
              }),
            ),
            const SizedBox(height: 16),
            _buildAnimatedSection(
              5,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionTitle('Your Ride, Your Way', sectionTitleFontSize),
                  const SizedBox(height: 1),
                  Text(
                    'We get it done – that’s Idhar Udhar for you',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: size.width * 0.03,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildAnimatedSection(6, _buildGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedSection(int index, Widget child) {
    return AnimatedOpacity(
      opacity: _visible[index] ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      child: AnimatedSlide(
        offset: _visible[index] ? Offset.zero : const Offset(0, 0.05),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        child: child,
      ),
    );
  }

  Widget _buildTopBar(Size size) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.black),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.019,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.notifications, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _buildSection(String title, double fontSize, String imgPath, VoidCallback onTap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sectionTitle(title, fontSize),
        const SizedBox(height: 10),
        InkWell(
          onTap: onTap,
          child: roundedImage(imgPath, MediaQuery.of(context).size),
        ),
      ],
    );
  }

  Widget _buildBikeBagRow(Size size, double fontSize) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              sectionTitle('Swift Rides, Zero Wait', fontSize),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/selectbikelocation');
                  rideType = "bike";
                },
                child: roundedImage('assets/images/home/bike.png', size),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            children: [
              sectionTitle('Swift Rides, Zero Wait', fontSize),
              const SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => Scaffold(body: DeliveryScreen())));
                },
                child: roundedImage('assets/images/home/bag.png', size),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGrid() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        _gridTile('Bike Ride', 'assets/images/home/bike1.png', () {
          Navigator.pushNamed(context, '/selectbikelocation');
          rideType = "bike";
        }),
        _gridTile('Car Ride', 'assets/images/home/car1.png', () {
          Navigator.pushNamed(context, '/selectcarlocation');
          rideType = "car";
        }),
        _gridTile('Auto Ride', 'assets/images/home/auto.png', () {
          Navigator.pushNamed(context, '/selectautolocation');
          rideType = "auto";
        }),
        _gridTile('Send a Parcel', 'assets/images/home/parcel.png', () {
          Navigator.pushNamed(context, '/selectparceltype');
        }),
      ],
    );
  }

  Widget _gridTile(String title, String path, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: rideTile(title, path),
    );
  }

  Widget sectionTitle(String title, double fontSize) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget roundedImage(String path, Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        path,
        height: size.height * 0.22,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget rideTile(String title, String path) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            width: 25,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.5),
              child: Image.asset('assets/images/icons/right-arrow.png'),
            ),
          ),
        ),
      ],
    );
  }
}
