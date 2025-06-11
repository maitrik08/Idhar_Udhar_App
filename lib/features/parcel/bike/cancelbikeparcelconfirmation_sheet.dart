import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../core/themes/colors.dart';
import '../../home/home_screen.dart';
import '../../mainlayout.dart';
import 'bikeparcelcancelationfail_sheet.dart'; // Make sure this has AppColors.red etc.

void showCancelBikeParcelConfirmationSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
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
            SizedBox(height: 10),

            // Title
            Text(
              'Are you sure you want to cancel?',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(height: 20),

            // Profile + Trip Message
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/profile.png'), // Replace with your image
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cancel Delivery?',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.6,
                      child: Text(
                        'Your delivery partner is already on the way.',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // Wrong pickup location row
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.white70, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Wrong pickup location?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.white70, size: 18),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),

            SizedBox(height: 30),
            InkWell(
              onTap: () {
                showCancellationFailedSheet(context);
              },
              child: Text('Cancellation Failed'),
            ),
            // Cancel Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Scaffold(body: MainLayout())),
                );
              }, // cancel ride logic
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[850],
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ButtonBorderRadius),
                ),
              ),
              child: Text(
                'CANCEL Delivery',
                style: TextStyle(color: Colors.red),
              ),
            ),

            SizedBox(height: 12),

            // No Button
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[850],
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ButtonBorderRadius),
                ),
              ),
              child: Text('NO', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    },
  );
}
