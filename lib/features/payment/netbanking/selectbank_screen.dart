import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../core/themes/colors.dart';
import 'hdfcbanklogin_screen.dart';
class PaymentBottomSheet {
  static void showbankPaymentSheet(BuildContext context) {
    String? selectedBankName;

    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
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
                      "Select your bank",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Bank List
                    Expanded(
                      child: ListView(
                        children: [
                          _buildBankTile(
                            'Paytm',
                            'assets/images/payment/paytm.png',
                            context,
                            selectedBankName,
                                (newBank) => setState(() => selectedBankName = newBank),
                          ),
                          _buildBankTile(
                            'PhonePe',
                            'assets/images/payment/phonpay.png',
                            context,
                            selectedBankName,
                                (newBank) => setState(() => selectedBankName = newBank),
                          ),
                          _buildBankTile(
                            'Amazon Pay',
                            'assets/images/payment/amazonpay.png',
                            context,
                            selectedBankName,
                                (newBank) => setState(() => selectedBankName = newBank),
                          ),
                          _buildBankTile(
                            'Mobikwik',
                            'assets/images/payment/mobikwik.png',
                            context,
                            selectedBankName,
                                (newBank) => setState(() => selectedBankName = newBank),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Proceed Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedBankName == null
                              ? Colors.grey
                              : AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonBorderRadius),
                          ),
                        ),
                        onPressed: selectedBankName == null
                            ? null
                            : () {// Close bank sheet
                          BankLoginSheet.show(context, bankName: selectedBankName!);
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
            );
          },
        );
      },
    );
  }

  static Widget _buildBankTile(
      String name,
      String assetPath,
      BuildContext context,
      String? selectedBankName,
      Function(String) onSelected,
      ) {

    return InkWell(
      onTap: () => onSelected(name),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(assetPath, width: 80, height: 40),
            Icon(
              Icons.navigate_next_outlined,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
