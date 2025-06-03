import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class ConfirmcardPaymentScreen extends StatelessWidget {
  const ConfirmcardPaymentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Expanded(
                  child: Container()
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    switch (RideType) {
                      case 'bike':
                        Navigator.pushNamed(context, '/confirmmapbike');
                        break;
                      case 'auto':
                        Navigator.pushNamed(context, '/confirmmapauto'); // ✅ This shows the sheet
                        break;
                      case 'car':
                        Navigator.pushNamed(context, '/confirmmapcar'); // ✅ This shows the sheet
                        break;
                      default:
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('ride not implemented')),
                        );
                    }
                    //Navigator.pushNamed(context, '/confirmmapbike');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "You’re Good to Go",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 15,)
            ],
          ),
        ),
      ),
    );
  }
}
