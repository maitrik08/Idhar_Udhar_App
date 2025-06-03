import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

import '../verifyOTP_screen.dart';

class WalletLoginSheet {
  static void show(BuildContext context, {required String walletName}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets, // Handles keyboard
          child: DraggableScrollableSheet(
            expand: false,
            builder: (_, controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Padding(
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

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.arrow_back,color: Colors.black,),
                      ),

                      const SizedBox(height: 16),
                      Text(
                        'Login to $walletName Wallet',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Number', style: TextStyle(fontSize: 14,color: Colors.black)),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter your number',
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.phone,color: Colors.black,),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            OtpVerificationSheet.show(context);
                           // Navigator.pop(context);
                          },
                          child: const Text(
                            'Get OTP',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
