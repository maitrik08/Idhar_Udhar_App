import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with TickerProviderStateMixin {
  late AnimationController _autoController;
  late AnimationController _bikeController;
  late AnimationController _carController;
  late AnimationController _circleController;

  late Animation<Offset> _autoOffset;
  late Animation<Offset> _bikeOffset;
  late Animation<Offset> _carOffset;
  late Animation<double> _circleOpacity;

  @override
  void initState() {
    super.initState();

    _autoController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _bikeController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _carController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _circleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));

    _autoOffset = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _autoController, curve: Curves.easeOut),
    );
    _bikeOffset = Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _bikeController, curve: Curves.easeOut),
    );
    _carOffset = Tween<Offset>(begin: const Offset(1.5, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _carController, curve: Curves.easeOut),
    );
    _circleOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _circleController, curve: Curves.easeIn),
    );

    // Run animations with delay
    _circleController.forward();
    Future.delayed(const Duration(milliseconds: 300), () => _autoController.forward());
    Future.delayed(const Duration(milliseconds: 700), () => _bikeController.forward());
    Future.delayed(const Duration(milliseconds: 1200), () => _carController.forward());
  }

  @override
  void dispose() {
    _autoController.dispose();
    _bikeController.dispose();
    _carController.dispose();
    _circleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.3,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Car
                  Positioned(
                    top: screenSize.width * 0.2,
                    left: screenSize.width * 0.38,
                    child: SlideTransition(
                      position: _carOffset,
                      child: Image.asset(
                        'assets/images/car.png',
                        width: screenSize.width * 0.65,
                      ),
                    ),
                  ),
                  // Auto
                  Positioned(
                    bottom: screenSize.height * 0.025,
                    right: screenSize.width * 0.25,
                    child: SlideTransition(
                      position: _autoOffset,
                      child: Image.asset(
                        'assets/images/auto.png',
                        width: screenSize.width * 0.46,
                      ),
                    ),
                  ),
                  // Bike
                  Positioned(
                    top: screenSize.height * 0.07,
                    left: screenSize.width * 0.01,
                    child: SlideTransition(
                      position: _bikeOffset,
                      child: Image.asset(
                        'assets/images/bike.png',
                        width: screenSize.width * 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ..._buildAnimatedCircles(screenSize),
          // Tagline
          Align(
            alignment: const Alignment(0, -0.46),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.14),
              child: Text(
                'Ride Clean. Live Green. A Better Way to Book, Travel, and Deliver.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * 0.058,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Get Start Button
          Positioned(
            bottom: 50,
            left: 24,
            right: 24,
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/loginsignup'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ButtonBorderRadius),
                  ),
                ),
                child: Text(
                  'Get Start',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.045,
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  List<Widget> _buildAnimatedCircles(Size screenSize) {
    return [
      Positioned(
        top: screenSize.height * 0.05,
        right: screenSize.width * 0.05,
        child: FadeTransition(opacity: _circleOpacity, child: _buildCircle(screenSize.width * 0.25)),
      ),
      Positioned(
        bottom: screenSize.height * 0.29,
        left: screenSize.width * -0.07,
        child: FadeTransition(opacity: _circleOpacity, child: _buildCircle(screenSize.width * 0.3)),
      ),
      Positioned(
        bottom: screenSize.height * 0.25,
        right: screenSize.width * 0.05,
        child: FadeTransition(opacity: _circleOpacity, child: _buildCircle(screenSize.width * 0.10)),
      ),
      Positioned(
        bottom: screenSize.height * -0.05,
        right: screenSize.width * 0.45,
        child: FadeTransition(opacity: _circleOpacity, child: _buildCircle(screenSize.width * 0.15)),
      ),
    ];
  }

  Widget _buildCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [
            AppColors.primarylite,
            AppColors.primarylite,
            AppColors.primary,
          ],
        ),
      ),
    );
  }
}
