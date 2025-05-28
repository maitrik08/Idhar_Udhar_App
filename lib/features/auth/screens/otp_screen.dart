import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/themes/colors.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final int otpLength = 6;
  List<TextEditingController> controllers = [];
  List<FocusNode> focusNodes = [];
  Timer? _timer;
  int _start = 30;
  bool canResend = false;

  @override
  void initState() {
    super.initState();
    // Initialize controllers and focus nodes for each OTP digit
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
    startTimer();
  }

  void startTimer() {
    setState(() {
      canResend = false;
      _start = 30;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        timer.cancel();
        setState(() {
          canResend = true;
        });
      } else {
        setState(() {
          _start--;
        });
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

  String getEnteredOTP() {
    return controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
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
                "We’ve sent a 6-digit verification code to your registered mobile number/email. Please enter it below to verify your identity.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 40),

              // Custom OTP input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(otpLength, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: AspectRatio(
                        aspectRatio: 1,
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.green),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Colors.black,
                          ),
                          onChanged: (value) {
                            if (value.length == 1) {
                              if (index < otpLength - 1) {
                                FocusScope.of(context)
                                    .requestFocus(focusNodes[index + 1]);
                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                            }
                          },
                        ),
                      ),
                    ),
                  );
                }),
              ),


              const SizedBox(height: 20),

              // Resend OTP
              GestureDetector(
                onTap: canResend ? startTimer : null,
                child: Text(
                  canResend ? "Resend OTP" : "Resend OTP in $_start sec",
                  style: TextStyle(
                    color: canResend ? AppColors.primary : Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const Spacer(),

              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    String otp = getEnteredOTP();
                    debugPrint("Entered OTP: $otp");
                    Navigator.pushNamed(context, '/age');
                    // Add your OTP validation/submit logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary, // green
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Login Text
              RichText(
                text: TextSpan(
                  text: "Already have a account ? ",
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
                          Navigator.pushNamed(context, '/login');
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
