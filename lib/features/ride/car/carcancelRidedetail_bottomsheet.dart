import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/colors.dart' show AppColors;
import 'carcancelride_sheet.dart';


void showCarRideDetailsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    enableDrag: false,
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      final screenHeight = MediaQuery.of(context).size.height;
      return Container(
        height: screenHeight * 0.60, // Fixed height (e.g. 55% of screen)
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Ride Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 24),

            _buildRideStep(
              leading: const Icon(Icons.radio_button_checked, color: Colors.white),
              text: 'Meet at the pickup point',
              showEdit: true,
              isLast: false,
            ),
            _buildRideStep(
              leading: Image.asset(
                'assets/images/icons/locationsquare.png',
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              text: 'Sardar Vallabhbhai Patel International Airport\n11:11am dropoff',
              showEdit: false,
              isLast: true,
            ),

            const SizedBox(height: 8),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 11,
                  child: Icon(Icons.currency_rupee, color: Colors.white, size: 17),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Amount Paid',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.white),
                ),
                const Spacer(),
                const Text('₹ 244', style: TextStyle(fontSize: 16, color: Colors.white)),
              ],
            ),

            const SizedBox(height: 10),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.share, color: Colors.white),
              label: const Text('Share Trip Status'),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: false,
                  enableDrag: false,
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (_) => CancelCarTripSheet(),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ButtonBorderRadius),
                ),
              ),
              child: const Text('Cancel ride', style: TextStyle(color: Colors.white)),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ButtonBorderRadius),
                ),
              ),
              child: const Text('Close', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),


      );
    },
  );
}


Widget _buildRideStep({
  required Widget leading,
  required String text,
  required bool showEdit,
  required bool isLast,
}) {

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          leading,
          if (!isLast)
            Container(
              width: 2,
              height: 40,
              color: Colors.grey,
            ),
        ],
      ),

      SizedBox(width: 10),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              if (showEdit)
                IconButton(
                  icon: Icon(Icons.edit, size: 18),
                  onPressed: () {},
                  color: Colors.white70,
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
            ],
          ),
        ),
      ),
    ],
  );
}

