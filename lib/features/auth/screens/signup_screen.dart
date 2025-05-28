import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';


class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: screenHeight * 0.09),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Create a New Account',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.01),
            Center(
              child: Text(
                'Join us to start your journey. Enter your details below to create a new account.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            SizedBox(height: 30),
            _buildInputField(icon: Icons.person, hint: "Enter your name"),
            SizedBox(height: 20),
            _buildInputField(icon: Icons.email, hint: "Enter your email"),
            SizedBox(height: screenHeight*0.02),
            _buildPasswordField(
              hint: "Password",
              obscureText: !_showPassword,
              toggle: () => setState(() => _showPassword = !_showPassword),
              isVisible: _showPassword,
            ),
            SizedBox(height: screenHeight*0.02),
            _buildPasswordField(
              hint: "Confirm Password",
              obscureText: !_showConfirmPassword,
              toggle: () => setState(() => _showConfirmPassword = !_showConfirmPassword),
              isVisible: _showConfirmPassword,
            ),
            SizedBox(height: screenHeight*0.17),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                      Navigator.pushNamed(context, '/languageselection');
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.white),
                  children: [

                    TextSpan(
                      text: "Log in",
                      style: TextStyle(color: AppColors.primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushNamed(context, '/login');
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({required IconData icon, required String hint}) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary)
          )
      ),
    );
  }

  Widget _buildPasswordField({
    required String hint,
    required bool obscureText,
    required VoidCallback toggle,
    required bool isVisible,
  }) {
    return TextField(
      obscureText: obscureText,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Colors.white70),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white70,
          ),
          onPressed: toggle,
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.red)
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primary)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.primary)
        )
      ),
    );
  }
}
