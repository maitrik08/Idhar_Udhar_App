import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

import '../../../core/constants/constants.dart';

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                children: [
                  SizedBox(height: height*0.09,),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: height*0.09,
                        width: height*0.09,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(height*0.5)
                        ),
                      ),
                      Image.asset('assets/images/world.png',height:height*0.13, width: height*0.13,),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Allow Location Access",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Text(
                      "Your location helps us connect you to the nearest services instantly.",
                      style: TextStyle(color: Colors.white,fontSize: screenSize.width*0.03),
                      textAlign: TextAlign.center,
                                       ),
                   ),
                ],
              ),
              Flexible(
                child: Image.asset(
                  'assets/images/locationVector.png',
                  width: screenSize.width,
                  fit: BoxFit.contain,
                ),
              ),
              /// Bottom Section - Button and Login
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/layout');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ButtonBorderRadius),
                        ),
                      ),
                      child: const Text(
                        'Allow Access',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
