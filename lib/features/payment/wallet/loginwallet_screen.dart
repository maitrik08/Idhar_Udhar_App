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
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8, // 🔒 Fixed height
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

               Row(
                 children: [
                   InkWell(
                     onTap: () => Navigator.pop(context),
                     child: const Icon(Icons.arrow_back, color: Colors.black),
                   ),

                   const SizedBox(height: 16),

                   Expanded(
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           'Login to $walletName Wallet',
                           style: const TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             color: Colors.black,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),

                const SizedBox(height: 30),

                const Text(
                  'Number',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Enter your number',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.phone_outlined, color: Colors.black),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
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
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {
                      OtpVerificationSheet.show(context);
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
    );
  }
}
