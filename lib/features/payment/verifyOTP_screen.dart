import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'confirmpaymentsheet.dart';

class OtpVerificationSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFE0E0E0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets, // for keyboard
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Drag handle
                    Container(
                      height: 4,
                      width: 40,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const Row(
                      children: [
                        Icon(Icons.arrow_back,color: Colors.black,),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Verify OTP",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Enter the code we sent to your wallet-linked number.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14,color: Colors.black),
                    ),
                    const SizedBox(height: 24),
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
                    const Text(
                      "Resend OTP",
                      style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6), // Small radius for rectangle
                          ),
                        ),
                        onPressed: () {
                          showConfirmPaymentDialog(context);
                          //Navigator.pop(context);
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
      },
    );
  }
}
