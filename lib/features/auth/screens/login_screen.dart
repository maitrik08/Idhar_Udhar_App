import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.05),

                        // Title
                        Center(
                          child: Text(
                            'Log In to Your Account',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.015),

                        // Subtitle
                        Center(
                          child: Text(
                            'Continue where you left off — your rides and bookings await.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: size.width * 0.037,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),

                        // Email Field
                        Text('Email', style: TextStyle(color: Colors.white, fontSize: size.width * 0.04)),
                        const SizedBox(height: 8),
                        _customInputField(
                          icon: Icons.email_outlined,
                          hintText: 'Enter your email',
                        ),
                        SizedBox(height: size.height * 0.03),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.white70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Center(
                                child: Text(
                                  'or',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: size.width * 0.037,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                        // Number Field
                        Text('Number', style: TextStyle(color: Colors.white, fontSize: size.width * 0.04)),
                        const SizedBox(height: 8),
                        _customInputField(
                          icon: Icons.phone_outlined,
                          hintText: 'Enter your number',
                        ),
                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            AppColors.primary.withOpacity(0.5), // Adjust opacity here
                            BlendMode.srcATop, // Use srcATop or modulate for smooth overlay
                          ),
                          child: Image.asset(
                            'assets/images/loginVector.png',
                            width: size.width,
                            fit: BoxFit.fitWidth,
                          ),
                        ),

                        SizedBox(height: size.height * 0.02),

                        // Login Button
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.025),

                        // Optional: Add Sign Up link
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: "Don’t have an account? ",
                              style: const TextStyle(color: Colors.white70),
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/signup');
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Custom TextField Widget
  Widget _customInputField({required IconData icon, required String hintText}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white38),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
