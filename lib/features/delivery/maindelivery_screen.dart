import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:idhar_udhar/core/themes/colors.dart';
class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double titleFontSize = size.width * 0.055;
    double subtitleFontSize = size.width * 0.033;
    double sectionTitleSize = size.width * 0.043;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Coming Soon: Your Daily Hustle, Delivered.",
              style: TextStyle(
                color: Colors.white,
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Groceries, meals, and parcels — just a tap away, the Idhar Udhar way.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: subtitleFontSize,
              ),
            ),
            const SizedBox(height: 24),

            buildDeliveryCard(
              context,
              imagePath: "assets/images/delivery/pizza.png",
              title: "Cravings? Covered Soon.",
              description: "Delicious food from your favorite places — hot & fast!",
            ),
            const SizedBox(height: 16),
            buildDeliveryCard(
              context,
              imagePath: "assets/images/delivery/grocery.png",
              title: "Fresh Bazaars to Your Doorstep.",
              description: "Handpicked veggies & daily needs coming to your kitchen soon.",
            ),
            const SizedBox(height: 16),
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

  Widget buildDeliveryCard(BuildContext context,
      {required String imagePath, required String title, required String description}) {
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
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: const EdgeInsets.only(left: 15,top: 25,bottom: 25),
                  color: AppColors.primary.withOpacity(0.3), // semi-transparent overlay
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * 0.043,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: size.width * 0.031,
                        ),
                      ),
                    ],
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
