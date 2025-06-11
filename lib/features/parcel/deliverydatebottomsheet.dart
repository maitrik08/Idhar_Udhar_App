import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

import '../../core/constants/constants.dart';
import 'auto/autodeliverysnapshotsheet.dart';
import 'bike/bikedeliverysnapshotsheet.dart';
import 'car/cardeliverysnapshotsheet.dart';

class DeliveryDateBottomSheet extends StatelessWidget {
  const DeliveryDateBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Container(
      height: size.height * 0.71, // Fixed height (adjustable)
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // Title
          Text(
            "When Should We Deliver Your Parcel?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 16 * textScale,
            ),
          ),
          const SizedBox(height: 30),

          // Delivery Date Field
          _customTextField(hint: "Enter Delivery Date", onTap: () {
            // showDatePicker logic here
          }),

          const SizedBox(height: 16),

          // Time Field
          _customTextField(hint: "What Time Works Best?", onTap: () {
            // showTimePicker logic here
          }),

          const Spacer(flex: 2,),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                switch (RideType) {
                  case 'bike-parcel':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent, // Make it blend naturally
                      builder: (_) => const BikeDeliverySnapshotContent(),
                    );
                    break;
                  case 'car-parcel':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent, // Make it blend naturally
                      builder: (_) => const CarDeliverySnapshotContent(),
                    );
                    break;
                  case 'truck-parcel':
                    Navigator.pushNamed(context, '/confirmmapcar');
                    break;
                  case 'auto-parcel':
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent, // Make it blend naturally
                      builder: (_) => const AutoDeliverySnapshotContent(),
                    );
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('ride not implemented')),
                    );
                }


              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ButtonBorderRadius),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customTextField({required String hint, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerLeft,
        child: Text(
          hint,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ),
    );
  }
}
