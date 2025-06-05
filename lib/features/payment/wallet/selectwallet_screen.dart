import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

import 'loginwallet_screen.dart' show WalletLoginSheet;

class WalletPaymentBottomSheet {
  static void showWalletPaymentSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        expand: false,
        builder: (_, controller) => Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // Drag handle
              Container(
                height: 4,
                width: 40,
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Text(
                "Select your Wallet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              SizedBox(height: 20),

              // Payment options
              Expanded(
                child: ListView(
                  controller: controller,
                  children: [
                    _buildBankTile('SBI', 'assets/images/payment/sbi.png','',context),
                    _buildBankTile('ICICI', 'assets/images/payment/icici.png','',context),
                    _buildBankTile('HDFC', 'assets/images/payment/hdfc.png','',context),
                    _buildBankTile('Axis', 'assets/images/payment/axisbank.png','',context),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Proceed Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // Small radius for rectangle
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    WalletLoginSheet.show(context, walletName: '');
                  },
                  child: Text(
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

  static Widget _buildBankTile(String name, String assetPath ,String navigatepath, context ) {
    return ListTile(
      leading: Image.asset(assetPath,width: 40,),
      title: Text(name,style: TextStyle(color: Colors.black),),
      onTap: () {
        Navigator.pushNamed(context, navigatepath);
      },
    );
  }
}
