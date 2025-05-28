import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Circles
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: screenSize.width,
              height: screenSize.height * 0.3, // Adjust height as needed
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: screenSize.width *0.2,
                    left: screenSize.width * 0.38,
                    child: Image.asset(
                      'assets/images/car.png',
                      width: screenSize.width * 0.65,
                    ),
                  ),

                  // Auto - middle layer, center-left
                  Positioned(
                    bottom: screenSize.height * 0.025,
                    right: screenSize.width * 0.25,
                    child: Image.asset(
                      'assets/images/auto.png',
                      width: screenSize.width * 0.46,
                    ),
                  ),

                  // Bike - top layer, slightly above and left
                  Positioned(
                    top: screenSize.height * 0.07,
                    left: screenSize.width * 0.01,
                    child: Image.asset(
                      'assets/images/bike.png',
                      width: screenSize.width * 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: screenSize.height * 0.05,
            right: screenSize.width * 0.05,
            child: _buildCircle(screenSize.width * 0.25),
          ),
          Positioned(
            bottom: screenSize.height * 0.29,
            left: screenSize.width * -0.07,
            child: _buildCircle(screenSize.width * 0.3),
          ),
          Positioned(
            bottom: screenSize.height * 0.25,
            right: screenSize.width * 0.05,
            child: _buildCircle(screenSize.width * 0.10),
          ),
          Positioned(
            bottom: screenSize.height * -0.05,
            right: screenSize.width * 0.45,
            child: _buildCircle(screenSize.width * 0.15),
          ),

          // Tagline Text
          Align(
            alignment: const Alignment(0, -0.46),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: screenSize.width*0.03),
              child: Text(
                'Ride Clean. Live Green.A Better Way to Book,Travel, and Deliver.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenSize.width * 0.055,
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
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/loginsignup');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Get Start',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenSize.width * 0.045,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
        gradient: RadialGradient(
            colors: [
              AppColors.primarylite,
              AppColors.primarylite,
              AppColors.primary,
            ]
        )
      ),
    );
  }
}
