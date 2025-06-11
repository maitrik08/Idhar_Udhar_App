import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'loginwallet_screen.dart' show WalletLoginSheet;

class WalletPaymentBottomSheet {
  static void showWalletPaymentSheet(BuildContext context) {
    String selectedWallet = ''; // ✅ Track selected wallet name

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
                padding: EdgeInsets.fromLTRB(
                  16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 20,
                ),
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
                          _buildBankTile('SBI', 'assets/images/payment/sbi.png', context, (wallet) {
                            setState(() => selectedWallet = wallet);
                          }),
                          _buildBankTile('ICICI', 'assets/images/payment/icici.png', context, (wallet) {
                            setState(() => selectedWallet = wallet);
                          }),
                          _buildBankTile('HDFC', 'assets/images/payment/hdfc.png', context, (wallet) {
                            setState(() => selectedWallet = wallet);
                          }),
                          _buildBankTile('Mobikwik', 'assets/images/payment/mobikwik.png', context, (wallet) {
                            setState(() => selectedWallet = wallet);
                          }),
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
                          if (selectedWallet.isNotEmpty) {
                            WalletLoginSheet.show(context, walletName: selectedWallet);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please select a wallet first.")),
                            );
                          }
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
      void Function(String) onSelected,
      ) {
    return InkWell(
      onTap: () {
        onSelected(name); // ✅ update wallet name
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(assetPath, width: 90, height: 50),
            const Icon(Icons.navigate_next_outlined, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
