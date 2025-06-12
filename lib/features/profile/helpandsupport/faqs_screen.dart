import 'package:flutter/material.dart';

import '../../../core/themes/colors.dart' show AppColors;

class FAQScreen extends StatelessWidget {
  final List<String> faqQuestions = [
    "What Makes A Good Taxi Service?",
    "What Is The Purpose Of A Taxi Service?",
    "How to download the IdharUdhar app?",
    "What Should I Be Asking For First Ride?",
    "How many cars does IdharUdhar have?",
    "Are the drivers background checked?",
    "Can I pay by cash or card?",
    "What is the cancellation policy?",
    "Is there a loyalty or rewards program?",
    "How do I contact customer support?",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Frequently Asked Questions", style: TextStyle(color: Colors.white,fontSize: 18)),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: faqQuestions.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    faqQuestions[index],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontFamily:'lexend'
                    ),
                  ),
                ),
                Icon(Icons.add, color: AppColors.primary, size: 24),
              ],
            ),
          );
        },
      ),
    );
  }
}
