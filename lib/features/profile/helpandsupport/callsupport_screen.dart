import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/themes/colors.dart';

class CallSupportScreen extends StatelessWidget {
  final String supportNumber = "+9118001234567"; // change if needed

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Call Support",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Need help urgently? Call us directly\nfor immediate assistance.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 80),
                  Icon(Icons.phone_outlined, size: 100, color: AppColors.primary),
                  const SizedBox(height: 30),
                  Text(
                    supportNumber,
                    style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Available 8 AM - 10 PM Emergency Support available 24/7",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 115),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonBorderRadius)),
                    ),
                    onPressed: () => _makePhoneCall(supportNumber),
                    child: const Text("Call Now", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
