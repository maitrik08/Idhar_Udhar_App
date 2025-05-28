import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class LoginSignupScreen extends StatelessWidget {
  const LoginSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              // Top Welcome Text
              Column(
                children: [
                  Text(
                    'Welcome to IdharUdhar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenSize.width * 0.06,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'lexend',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Get started by logging into your existing\naccount or create a new one to enjoy\nour services.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: screenSize.width * 0.038,
                      fontFamily: 'inter',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              const Spacer(),

              // Car Image
              SizedBox(
                width: screenSize.width,
                child: Image.asset(
                  'assets/images/welcomeVector.png',
                  fit: BoxFit.contain,
                ),
              ),

              const Spacer(),

              // Buttons
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
