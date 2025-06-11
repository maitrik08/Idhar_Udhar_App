import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

import '../../core/constants/constants.dart';


class SelectParcelBikeLocationScreen extends StatefulWidget {
  const SelectParcelBikeLocationScreen({super.key});

  @override
  State<SelectParcelBikeLocationScreen> createState() => _SelectParcelBikeLocationScreenState();
}

class _SelectParcelBikeLocationScreenState extends State<SelectParcelBikeLocationScreen> {
  final TextEditingController currentLocationController = TextEditingController();
  final TextEditingController dropDownLocationController = TextEditingController();

  @override
  void dispose() {
    currentLocationController.dispose();
    dropDownLocationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow
              const Icon(Icons.arrow_back, color: Colors.white, size: 28),

              const SizedBox(height: 30),

              // Current location field
              _locationInputField("Current location", currentLocationController),

              const SizedBox(height: 20),

              // Drop down location field
              _locationInputField("Drop down location", dropDownLocationController),

              const SizedBox(height: 20),

              // Select on map button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.location_on_outlined),
                label: const Text("Select on map"),
                onPressed: () {
                  // Add map selection logic here
                },
              ),

              const Spacer(),

              // Get Start button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ButtonBorderRadius),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/selectlocaionbikeparcel');
                  },
                  child: const Text(
                    "Confirm Address",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _locationInputField(String hintText, TextEditingController controller) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined, color: Colors.black),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(
                color: Colors.black
              ),
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Colors.black38
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
