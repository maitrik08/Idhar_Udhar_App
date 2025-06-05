import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

import 'hdfcbanklogin_screen.dart';

class PaymentBottomSheet {
  static void showbankPaymentSheet(BuildContext context) {
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
                "Select your bank",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
              ),
              SizedBox(height: 20),

              // Payment options
              Expanded(
                child: ListView(
                  controller: controller,
                  children: [
                    _buildBankTile('Paytm', 'assets/images/payment/paytm.png','',context),
                    _buildBankTile('PhonePe', 'assets/images/payment/phonpay.png','',context),
                    _buildBankTile('Amazon Pay', 'assets/images/payment/amazonpay.png','',context),
                    _buildBankTile('Mobikwik', 'assets/images/payment/mobikwik.png','',context),
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
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // Small radius for rectangle
                    ),
                  ),
                  onPressed: () {
                    HdfcLoginSheet.show(context);
                    //Navigator.pop(context);
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
