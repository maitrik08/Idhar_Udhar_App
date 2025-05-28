import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: constraints.maxHeight * 0.05),

                          // Title
                          Center(
                            child: Text(
                              'Log In to Your Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.015),

                          // Subtitle
                          Center(
                            child: Text(
                              'Continue where you left off — your rides and bookings await.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: width * 0.035,
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.04),

                          // Email / Phone field
                          Text(
                            'Email/ Phone number',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.04,
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white38),
                            ),
                            child: const TextField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.mail_outline, color: Colors.white70),
                                hintText: 'Enter your email or phone',
                                hintStyle: TextStyle(color: Colors.white38),
                                contentPadding: EdgeInsets.symmetric(vertical: 14),
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.04),

                          // Image
                          Center(
                            child: Image.asset(
                              'aseets/images/loginVector.png', // Check your path
                              width: width * 0.7,
                              height: constraints.maxHeight * 0.23,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.03),

                          // Login Button
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/otpscreen');
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
                          SizedBox(height: constraints.maxHeight * 0.025),

                          // Divider with OR
                          Row(
                            children: [
                              const Expanded(child: Divider(color: Colors.white24)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text("OR", style: TextStyle(color: Colors.white60)),
                              ),
                              const Expanded(child: Divider(color: Colors.white24)),
                            ],
                          ),
                          SizedBox(height: constraints.maxHeight * 0.02),

                          // Google Button
                          _socialButton(
                            icon: FontAwesomeIcons.google,
                            text: 'Continue  with Google',
                            color: Colors.white,
                          ),
                          const SizedBox(height: 12),

                          // Facebook Button
                          _socialButton(
                            icon: FontAwesomeIcons.facebookF,
                            text: 'Continue  with Facebook',
                            color: Colors.white,
                          ),
                          const Spacer(),

                          // Sign Up Text
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Don’t have an account ? ",
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
                                        print("Sign Up tapped");
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: constraints.maxHeight * 0.03),
                        ],
                      ),
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

  Widget _socialButton({required IconData icon, required String text, required Color color}) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: color.withOpacity(0.2)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.grey.shade800,
        ),
        icon: FaIcon(icon, color: color),
        label: Text(
          text,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
