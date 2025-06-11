import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:idhar_udhar/core/themes/colors.dart';
class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double titleFontSize = size.width * 0.054;
    double subtitleFontSize = size.width * 0.024;
    double sectionTitleSize = size.width * 0.043;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width*0.8,
              child: Text(
                "Coming Soon: Your Daily Hustle, Delivered.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Groceries, meals, and parcels — just a tap away, the Idhar Udhar way.",
              style: TextStyle(
                color: Colors.white,
                fontSize: subtitleFontSize,
                fontWeight: FontWeight.w600
              ),
            ),
            const SizedBox(height: 24),

            buildDeliveryCard(
              context,
              imagePath: "assets/images/delivery/pizza.png",
              title: "Cravings? Covered Soon.",
              description: "Delicious food from your favorite places — hot & fast!",
            ),
            const SizedBox(height: 35),
            buildDeliveryCard(
              context,
              imagePath: "assets/images/delivery/grocery.png",
              title: "Fresh Bazaars to Your Doorstep.",
              description: "Handpicked veggies & daily needs coming to your kitchen soon.",
            ),
            const SizedBox(height: 35),
            buildDeliveryCard(
              context,
              imagePath: "assets/images/delivery/worker.png",
              title: "Courier Runs Made Effortless.",
              description: "Send parcels anywhere, anytime. Fast, safe & trackable.",
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDeliveryCard(
      BuildContext context, {
        required String imagePath,
        required String title,
        required String description,
      }) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            imagePath,
            width: double.infinity,
            height: size.height * 0.35,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  color: AppColors.primary.withOpacity(0.3),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      double contentWidth = constraints.maxWidth - 32; // subtract padding

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: contentWidth,
                            child: Text(
                              title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.043,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: contentWidth,
                            child: Text(
                              description,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.031,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
