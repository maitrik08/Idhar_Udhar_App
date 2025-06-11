import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../core/themes/colors.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: height * 0.09),
                  const Text(
                    "What's your Gender?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 33),
                    child: Text(
                      "We personalize your journey — just tell us a bit about you.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: size.width * 0.033),
                    ),
                  ),
                  SizedBox(height: height * 0.05),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Male GIF
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = 'male';
                          });
                        },
                        child: Container(
                          width: size.height * 0.2, // Ensure width equals height for circle
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Make the container circular
                            border: Border.all(
                              color: selectedGender == 'male' ? Colors.green : Colors.transparent,
                              width: 3.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              ClipOval( // Clip the image to a circle
                                child: Image.asset(
                                  'assets/animation/male.gif',
                                  height: size.height * 0.2,
                                  width: size.height * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (selectedGender == 'male')
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.05),
                      // Female GIF
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = 'female';
                          });
                        },
                        child: Container(
                          width: size.height * 0.2, // Ensure width equals height for circle
                          height: size.height * 0.2,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Make the container circular
                            border: Border.all(
                              color: selectedGender == 'female' ? Colors.green : Colors.transparent,
                              width: 2.0,
                            ),
                          ),
                          child: Stack(
                            children: [
                              ClipOval( // Clip the image to a circle
                                child: Image.asset(
                                  'assets/animation/female.gif',
                                  height: size.height * 0.2,
                                  width: size.height * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (selectedGender == 'female')
                                Positioned(
                                  bottom: 5,
                                  right: 5,
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: selectedGender == null
                          ? null // Disable button if no gender is selected
                          : () {
                        Navigator.pushNamed(context, '/locationaccess');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ButtonBorderRadius),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white70),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          "Log in",
                          style: TextStyle(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}