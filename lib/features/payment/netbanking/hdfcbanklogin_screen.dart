import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import '../../../core/constants/constants.dart';
import '../confirmpaymentsheet.dart';

class BankLoginSheet {
  static void show(BuildContext context, {required String bankName}) {
    final usernameController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Drag handle
                  Container(
                    height: 4,
                    width: 40,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Login to $bankName',
                            style: const TextStyle(fontSize: 18, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Enter your', style: TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    style: TextStyle(color: Colors.black,fontSize: 13),
                    controller: usernameController,
                    decoration: const InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(buttonBorderRadius)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Enter your Password', style: TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    style: TextStyle(color: Colors.black,fontSize: 13),
                    controller: usernameController,
                    decoration: const InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(buttonBorderRadius)),
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
                        Future.delayed(const Duration(milliseconds: 300), () {
                          showConfirmPaymentDialog(context);
                        });
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
    );
  }
}
