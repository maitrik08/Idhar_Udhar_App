import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import '../../core/constants/constants.dart';
import '../mainlayout.dart';

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
                // switch (rideType) {
                //   case 'bike':
                //     Navigator.pushNamed(context, '/confirmmapbike');
                //     break;
                //   case 'auto':
                //     Navigator.pushNamed(context, '/confirmmapauto');
                //     break;
                //   case 'car':
                //     Navigator.pushNamed(context, '/confirmmapcar');
                //     break;
                //   case 'bike-parcel':
                //     Navigator.pushNamed(context, '/bikeparcelmap');
                //     break;
                //   case 'car-parcel':
                //     Navigator.pushNamed(context, '/carparcelmap');
                //     break;
                //   case 'tata-ace':
                //     Navigator.pushNamed(context, '/tataaceparcelmap');
                //     break;
                //   case 'Pickup-Truck':
                //     Navigator.pushNamed(context, '/pickuptruck');
                //     break;
                //   case 'mini-Truck':
                //     Navigator.pushNamed(context, '/minitruck');
                //     break;
                //   case 'tempo':
                //     Navigator.pushNamed(context, '/tempo');
                //     break;
                //   case 'canter':
                //     Navigator.pushNamed(context, '/canter');
                //     break;
                //   case '14feet-truck':
                //     Navigator.pushNamed(context, '/truck14feet');
                //     break;
                //   case '19feet-truck':
                //     Navigator.pushNamed(context, '/truck19feet');
                //     break;
                //   case 'duty-truck':
                //     Navigator.pushNamed(context, '/dutytruck');
                //     break;
                //   case '32feet-truck':
                //     Navigator.pushNamed(context, '/truck32feet');
                //     break;
                //   case 'container-truck':
                //     Navigator.pushNamed(context, '/containertruck');
                //     break;
                //   default:
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(content: Text('ride not implemented')),
                //     );
                // }
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Scaffold(body: MainLayout())),
                );
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
