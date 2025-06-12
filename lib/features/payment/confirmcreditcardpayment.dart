import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class ConfirmcardPaymentScreen extends StatelessWidget {
  const ConfirmcardPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // for responsiveness

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: size.height*0.03,),
            Stack(
              children: [
                Image.asset(
                  'assets/images/payment/paymentcomplete.gif',
                  width: size.width,
                  fit: BoxFit.contain,
                ),
                Center(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeOutBack,
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Image.asset(
                            'assets/images/payment/paymentdone.png',
                            height: size.height * 0.4,
                            width: size.width - 150,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // Bottom Button (Wrapped in Padding directly instead of Positioned)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
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
                          const SnackBar(content: Text('Ride not implemented')),
                        );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonBorderRadius),
                    ),
                  ),
                  child: const Text(
                    "You’re Good to Go",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
