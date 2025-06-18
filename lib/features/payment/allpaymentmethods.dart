import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/payment/wallet/selectwallet_screen.dart';
import 'UPI/selectupi_screen.dart';
import 'netbanking/selectbank_screen.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final methods = [
      {'icon': Icons.credit_card, 'label': 'Credit Card'},
      {'icon': Icons.credit_card, 'label': 'Debit Card'},
      {'icon': Icons.credit_card, 'label': 'UPI'},
      {'icon': Icons.account_balance, 'label': 'Net Banking'},
      {'icon': Icons.account_balance_wallet, 'label': 'Wallets'},
      {'icon': Icons.money, 'label': 'Cash'},
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Color(0xFFE0E0E0), // light gray
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(11),
            child: Center(
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.arrow_back, color: Colors.black),
                ),
                const Text(
                  "Choose Payment Method",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.black),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: methods.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(methods[index]['icon'] as IconData, color: Colors.black),
                  title: Text(
                    methods[index]['label'] as String,
                    style: const TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    switch (methods[index]['label']) {
                      case 'Credit Card':
                        Navigator.pushNamed(context, '/creditcardpayment');
                        break;
                      case 'Debit Card':
                        Navigator.pushNamed(context, '/creditcardpayment');
                        break;
                      case 'UPI':
                        UPIPaymentBottomSheet.showUPIPaymentSheet(context);
                        break;
                      case 'Net Banking':
                        PaymentBottomSheet.showbankPaymentSheet(context);
                        break;
                      case 'Wallets':
                        WalletPaymentBottomSheet.showWalletPaymentSheet(context);
                        break;
                      default:
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${methods[index]['label']} not implemented')),
                        );
                    }
                  },
                );
              },
              separatorBuilder: (_, __) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Divider(height: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
