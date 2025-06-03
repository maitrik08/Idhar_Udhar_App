import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import '../confirmpaymentsheet.dart'; // Make sure this exists

class HdfcLoginSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFFE0E0E0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final usernameController = TextEditingController();
        final passwordController = TextEditingController();

        return Padding(
          padding: MediaQuery.of(context).viewInsets,
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
                      const Text(
                        'Login to HDFC NetBanking',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
                      ),
                      const SizedBox(height: 30),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Username', style: TextStyle(fontSize: 14)),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your username',
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.person,color: Colors.black,),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),

                      const SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Password', style: TextStyle(fontSize: 14,color: Colors.black)),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(color: Colors.black),
                          prefixIcon: Icon(Icons.lock,color: Colors.black,),
                          filled: true,
                          fillColor: Colors.white70,
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

                            Future.delayed(const Duration(milliseconds: 300), () {
                              showConfirmPaymentDialog(context); // Your confirmation sheet
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
              );
            },
          ),
        );
      },
    );
  }
}
