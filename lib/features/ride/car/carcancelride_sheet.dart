import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

import '../../../core/constants/constants.dart';
import 'carcancelrideconfirmation_sheet.dart';



class CancelCarTripSheet extends StatefulWidget {
  @override
  _CancelCarTripSheetState createState() => _CancelCarTripSheetState();
}

class _CancelCarTripSheetState extends State<CancelCarTripSheet> {
  int? selectedIndex;

  final reasons = [
    'Wait time was Too long',
    'Driver asked me to cancel or ride off app',
    'Driver not getting closer',
    'Could not find driver',
    'No helmet provided',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 20, 16, 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(
                'Cancel Trip?',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {}, // Skip action
                child: Text("Skip", style: TextStyle(color: Colors.white)),
              )
            ],
          ),
          SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Why do you want to cancel?',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          SizedBox(height: 16),
          ...List.generate(reasons.length, (index) {
            final reason = reasons[index];
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                selectedIndex = index;
                showCarCancelConfirmationSheet(context);
              },
              behavior: HitTestBehavior.translucent,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 9),
                  child: Text(
                    reason,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      color: isSelected ? AppColors.primary : Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/confirmmapcar');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: Size(double.infinity, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(ButtonBorderRadius), // Small radius for rectangle
              ),
            ),
            child: Text('Keep my Trip',style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}
