import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/constants.dart';
import '../../../core/services/authservices.dart';
import '../../../core/themes/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  bool isLoading = false;

  bool get _isInputValid =>
      emailController.text.trim().isNotEmpty || numberController.text.trim().isNotEmpty;

  void _onLoginPressed() async {
    final input = emailController.text.trim().isNotEmpty
        ? emailController.text.trim()
        : numberController.text.trim();

    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email or number')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await AuthService.login(identifier: input);

      setState(() => isLoading = false);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final userId = responseBody['userId'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', userId);

        Navigator.pushNamed(context, '/otpscreen');
      } else {
        final responseBody = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responseBody['msg'] ?? 'Login failed.')),
        );
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    numberController.dispose();
    super.dispose();
  }

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
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 40),

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

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Center(
                            child: Text(
                              'Continue where you left off — your rides and bookings await.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.033,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),

                        Text('Email', style: TextStyle(color: Colors.white, fontSize: size.width * 0.04)),
                        const SizedBox(height: 8),
                        _customInputField(
                          controller: emailController,
                          icon: Icons.email_outlined,
                          hintText: 'Enter your email',
                        ),
                        SizedBox(height: size.height * 0.03),

                        Row(
                          children: [
                            Expanded(child: Divider(color: Colors.white70)),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text('or', style: TextStyle(color: Colors.white70, fontSize: size.width * 0.037)),
                            ),
                            Expanded(child: Divider(color: Colors.white70)),
                          ],
                        ),
                        //const SizedBox(height: 8),

                        Text('Number', style: TextStyle(color: Colors.white, fontSize: size.width * 0.04)),
                        const SizedBox(height: 8),
                        _customInputField(
                          controller: numberController,
                          icon: Icons.phone_outlined,
                          hintText: 'Enter your number',
                          keyboardType: TextInputType.phone,
                        ),

                        ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            AppColors.primary.withOpacity(0.5),
                            BlendMode.srcATop,
                          ),
                          child: Image.asset(
                            'assets/images/loginVector.png',
                            width: size.width,
                            fit: BoxFit.fitWidth,
                          ),
                        ),

                        SizedBox(height: size.height * 0.05),

                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            //onPressed: isLoading ? null : _onLoginPressed,
                            onPressed: () {
                              Navigator.pushNamed(context, '/otpscreen');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(buttonBorderRadius),
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                                : const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.01),

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
                                      IsLogin = false;
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

  Widget _customInputField({
    required IconData icon,
    required String hintText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white30),
        borderRadius: BorderRadius.circular(buttonBorderRadius),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white38),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary)
          )
        ),
      ),
    );
  }
}
