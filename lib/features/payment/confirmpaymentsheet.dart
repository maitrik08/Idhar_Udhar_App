import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import '../../core/constants/constants.dart';

void showConfirmPaymentDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.white, // ✅ White background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(20),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Confirm your payment',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black, // ✅ Black text
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close, size: 20, color: Colors.black), // ✅ Black icon
              ),
            ],
          ),

          SizedBox(height: 10),
          Text(
            'This payment will be debited from your selected bank account.',
            style: TextStyle(
              fontSize: 10,
              color: Colors.black, // ✅ Black text
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 60),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius), // Small radius for rectangle
                ),
              ),
              onPressed: () {
                switch (rideType) {
                  case 'bike':
                    Navigator.pushNamed(context, '/confirmmapbike');
                    break;
                  case 'auto':
                    Navigator.pushNamed(context, '/confirmmapauto');
                    break;
                  case 'car':
                    Navigator.pushNamed(context, '/confirmmapcar');
                    break;
                  case 'bike-parcel':
                    Navigator.pushNamed(context, '/bikeparcelmap');
                    break;
                  case 'car-parcel':
                    Navigator.pushNamed(context, '/carparcelmap');
                    break;
                  case 'truck-parcel':
                    Navigator.pushNamed(context, '/confirmmapcar');
                    break;
                  case 'auto-parcel':
                    Navigator.pushNamed(context, '/autoparcelmap');
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('ride not implemented')),
                    );
                }
              },
              child: Text(
                'Pay ₹ 124',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
