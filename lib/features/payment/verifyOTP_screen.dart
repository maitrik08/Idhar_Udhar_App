import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../core/constants/constants.dart';
import 'confirmpaymentsheet.dart';

class OtpVerificationSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final height = MediaQuery.of(context).size.height * 0.80;
        return AnimatedPadding(
          // 🧠 Allows bottom padding to adapt when keyboard opens
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          child: Container(
            height: height, // 🧱 Fixed initial height
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Drag handle
                          Center(
                            child: Container(
                              height: 4,
                              width: 40,
                              margin: const EdgeInsets.only(bottom: 16),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),

                          const Icon(Icons.arrow_back, color: Colors.black),
                          const SizedBox(height: 16),

                          const Center(
                            child: Text(
                              "Verify OTP",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Center(
                            child: Text(
                              "Enter the code we sent to your wallet-linked number.",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),

                          const SizedBox(height: 40),

                          Center(
                            child: PinCodeTextField(
                              appContext: context,
                              length: 6,
                              mainAxisAlignment: MainAxisAlignment.center,
                              onChanged: (value) {},
                              textStyle: const TextStyle(
                                color: Colors.black, // ✅ OTP text color
                                fontWeight: FontWeight.bold,
                              ),
                              pinTheme: PinTheme(
                                fieldOuterPadding: EdgeInsetsGeometry.all(3),
                                selectedFillColor: Colors.black,
                                borderWidth: 1,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(6),
                                fieldHeight: 55,
                                fieldWidth: 40,
                                activeColor: Colors.black,
                                selectedColor: Colors.green,
                                inactiveColor: Colors.black,
                              ),
                              animationType: AnimationType.fade,
                              keyboardType: TextInputType.number,
                            ),
                          ),

                          const SizedBox(height: 12),
                          const Center(
                            child: Text(
                              "Resend OTP",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                          ),

                          const Spacer(),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(ButtonBorderRadius),
                                ),
                              ),
                              onPressed: () {
                                showConfirmPaymentDialog(context);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
