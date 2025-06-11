import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/colors.dart' show AppColors;
import 'autocancelride_sheet.dart';


  void showAutoRideDetailsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.45,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        builder: (_, controller) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            controller: controller,
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
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Ride Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 24),
              _buildRideStep(
                leading: Icon(Icons.radio_button_checked),
                text: 'Meet at the pickup point',
                showEdit: true,
                isLast: false,
              ),
              _buildRideStep(
                leading: Image.asset(
                  'assets/images/icons/locationsquare.png',
                  width: 20,
                  height: 20,
                  color: Colors.white, // Optional if you want to tint it
                ),
                text: 'Sardar Vallabhbhai Patel International Airport 11:11am dropoff',
                showEdit: false,
                isLast: true,
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  CircleAvatar(
                     backgroundColor: AppColors.primary,
                      radius: 11,
                      child: Icon(Icons.currency_rupee, color: Colors.white,size: 17,)
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Amount Paid',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Spacer(),

                ],
              ),
              Row(
                children: [
                  SizedBox(width: 32,),
                  Text(
                    '₹ 244',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.share,color: Colors.white,),
                  label: Text('Share Trip Status'),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (_) => CancelAutoTripSheet(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6), // Small radius for rectangle
                  ),
                ),
                child: Text('Cancel ride',style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ButtonBorderRadius), // Small radius for rectangle
                  ),
                ),
                child: Text('Close',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
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

