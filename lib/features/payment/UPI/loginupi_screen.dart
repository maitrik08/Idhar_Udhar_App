import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import '../../../core/constants/constants.dart';
import '../verifyOTP_screen.dart';

class UpiLoginSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.8, // 🔒 Fixed height
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 16, 20, MediaQuery.of(context).viewInsets.bottom + 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
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
                    color: Colors.black54,
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
                       const Text(
                         'Enter your UPI ID',
                         style: TextStyle(
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

              const Text('UPI ID', style: TextStyle(fontSize: 14, color: Colors.black,fontFamily: 'lexend')),
              const SizedBox(height: 8),

              TextFormField(
                style: TextStyle(color: Colors.black,fontSize: 12),
                keyboardType: TextInputType.emailAddress,
                cursorColor: AppColors.primary,
                decoration: const InputDecoration(
                  hintText: 'Enter your UPI ID',
                  hintStyle: TextStyle(color: Colors.black,fontSize: 12),
                  prefixIcon: Icon(Icons.call_outlined, color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.primary)
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
                      borderRadius: BorderRadius.circular(buttonBorderRadius),
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
      ),
    );
  }
}
