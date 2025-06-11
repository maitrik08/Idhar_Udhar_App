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
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.80, // 🔒 Fixed height
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              20,
              20,
              MediaQuery.of(context).viewInsets.bottom + 20,
            ),
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

                const SizedBox(height: 100),

                Column(
                  children: [
                    PinCodeTextField(
                      appContext: context,
                      length: 5,
                      onChanged: (value) {},
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(6),
                        fieldHeight: 50,
                        fieldWidth: 40,
                        activeColor: Colors.black,
                        selectedColor: Colors.green,
                        inactiveColor: Colors.black,
                      ),
                      animationType: AnimationType.fade,
                      keyboardType: TextInputType.number,
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
                  ],
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
        );
      },
    );
  }
}
