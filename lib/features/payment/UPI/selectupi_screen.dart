import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import '../../../core/constants/constants.dart';
import 'loginupi_screen.dart' show UpiLoginSheet;

class UPIPaymentBottomSheet {
  static void showUPIPaymentSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.8, // 🔒 Fixed height
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Drag handle
              Container(
                height: 4,
                width: 40,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              const Text(
                "Select your UPI App",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 20),

              // UPI App list (fixed height area)
              Expanded(
                child: ListView(
                  children: [
                    _buildUPITile('Google Pay', 'assets/images/payment/phonpay.png', '', context),
                    _buildUPITile('PhonePe', 'assets/images/payment/paytm.png', '', context),
                    _buildUPITile('Paytm UPI', 'assets/images/payment/gpay.png', '', context),
                    _buildUPITile('BHIM', 'assets/images/payment/bhimupi.png', '', context),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Proceed Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ButtonBorderRadius),
                    ),
                  ),
                  onPressed: () {
                    UpiLoginSheet.show(context);
                  },
                  child: const Text(
                    'Proceed To Pay',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildUPITile(String name, String assetPath, String navigatePath, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, navigatePath);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(assetPath, width: 80, height: 40),
            Icon(Icons.navigate_next_outlined,color: Colors.black,)
          ],
        ),
      ),
    );
  }
}
