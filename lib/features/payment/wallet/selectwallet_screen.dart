import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'loginwallet_screen.dart' show WalletLoginSheet;

class WalletPaymentBottomSheet {
  static void showWalletPaymentSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.55, // 🔒 Fixed height
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 20),
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
                "Select your Wallet",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),

              const SizedBox(height: 20),

              // Payment options
              Expanded(
                child: ListView(
                  children: [
                    _buildBankTile('SBI', 'assets/images/payment/sbi.png', '', context),
                    Divider(height: 1, color: Colors.grey.shade400),
                    _buildBankTile('ICICI', 'assets/images/payment/icici.png', '', context),
                    Divider(height: 1, color: Colors.grey.shade400),
                    _buildBankTile('HDFC', 'assets/images/payment/hdfc.png', '', context),
                    Divider(height: 1, color: Colors.grey.shade400),
                    _buildBankTile('Axis', 'assets/images/payment/axisbank.png', '', context),
                    Divider(height: 1, color: Colors.grey.shade400),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    WalletLoginSheet.show(context, walletName: '');
                  },
                  child: const Text(
                    'Proceed To Pay',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildBankTile(String name, String assetPath, String navigatePath, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, navigatePath),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Image.asset(assetPath, width: 60, height: 50),
            const SizedBox(width: 20),
            Text(name, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
