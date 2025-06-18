import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/constants/constants.dart';
import '../../../core/services/authservices.dart';
import '../../../core/themes/colors.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final int otpLength = 6;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;
  Timer? _timer;
  int _start = 60;
  bool canResend = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
    startTimer();
  }

  void startTimer() {
    setState(() {
      canResend = false;
      _start = 60;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
        setState(() => canResend = true);
      } else {
        setState(() => _start--);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String getEnteredOTP() => controllers.map((c) => c.text).join();

  Future<void> _verifyOTP() async {
    final otp = getEnteredOTP();
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');

    if (otp.length < otpLength || userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid OTP.')),
      );
      return;
    }

    setState(() => isLoading = true);

    try {
      final response = await AuthService.verifyOTP(otp: otp, userId: userId);

      setState(() => isLoading = false);

      if (response.statusCode == 200) {
        if (IsLogin!) {
          Navigator.pushNamed(context, '/layout');
        } else {
          Navigator.pushNamed(context, '/languageselection');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    } catch (e) {
      setState(() => isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error verifying OTP: $e')),
      );
    }
  }

  Future<void> _resendOTP() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    if (userId != null) {
      await AuthService.sendOTP(identifier: userId);
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final isKeyboardVisible = bottomInset > 0;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: isKeyboardVisible
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(
                left: size.width * 0.08,
                right: size.width * 0.08,
                bottom: bottomInset + 20,
                top: size.height * 0.05,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - bottomInset - 20,
                  maxHeight: isKeyboardVisible
                      ? double.infinity
                      : constraints.maxHeight - bottomInset - 20,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Verify Code",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "We’ve sent a 6-digit verification code to your registered mobile number/email. Enter it below to verify your identity.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 9.5),
                      ),
                      SizedBox(height: size.height * 0.14),

                      /// OTP Fields
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(otpLength, (index) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 4.0),
                              child: AspectRatio(
                                aspectRatio: 0.8,
                                child: TextField(
                                  controller: controllers[index],
                                  focusNode: focusNodes[index],
                                  maxLength: 1,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.height * 0.02,
                                  ),
                                  decoration: InputDecoration(
                                    counterText: '',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.circular(buttonBorderRadius),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.green),
                                      borderRadius:
                                      BorderRadius.circular(buttonBorderRadius),
                                    ),
                                    filled: true,
                                    fillColor: Colors.black,
                                  ),
                                  onChanged: (value) {
                                    if (value.length == 1 &&
                                        index < otpLength - 1) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNodes[index + 1]);
                                    } else if (value.isEmpty && index > 0) {
                                      FocusScope.of(context)
                                          .requestFocus(focusNodes[index - 1]);
                                    } else if (index == otpLength - 1 &&
                                        value.length == 1) {
                                      FocusScope.of(context).unfocus();
                                    }
                                  },
                                ),
                              ),
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 11),

                      GestureDetector(
                        onTap: canResend ? _resendOTP : null,
                        child: Text(
                          canResend
                              ? "Resend OTP"
                              : "Resend OTP in $_start sec",
                          style: TextStyle(
                            color: canResend
                                ? AppColors.primary
                                : Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      /// OTP Illustration
                      if (!isKeyboardVisible)
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Image.asset(
                              'assets/images/OTPVector.png',
                              width: size.width,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                      SizedBox(height: size.height * 0.06),

                      /// Submit Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          //onPressed: isLoading ? null : _verifyOTP,
                          onPressed: () {
                            if (IsLogin!) {
                              Navigator.pushNamed(context, '/layout');
                            } else {
                              Navigator.pushNamed(context, '/languageselection');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(buttonBorderRadius),
                            ),
                          ),
                          child: isLoading
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                              : const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// Login Text
                      RichText(
                        text: TextSpan(
                          text: "Already have an account? ",
                          style: const TextStyle(color: Colors.white70),
                          children: [
                            TextSpan(
                              text: "Log in",
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  IsLogin = true;
                                  Navigator.pushNamed(context, '/login');
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.05),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
