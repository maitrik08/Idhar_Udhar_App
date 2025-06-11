import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import 'addpaymentsheet.dart';

class PaymentSettingScreen extends StatefulWidget {
  const PaymentSettingScreen({super.key});

  @override
  State<PaymentSettingScreen> createState() => _PaymentSettingScreenState();
}

class _PaymentSettingScreenState extends State<PaymentSettingScreen> {
  final List<PaymentItem> _methods = [
    const PaymentItem(
      icon: Icons.credit_card_outlined,
      label: "HDFC Credit Card",
      number: "•••• 4242",
      expiry: "12/26",
      isDefault: true,
    ),
    const PaymentItem(
      icon: Icons.credit_card_outlined,
      label: "ICICI Debit Card",
      number: "•••• 5678",
      expiry: "09/25",
    ),
    const PaymentItem(
      icon: Icons.credit_card_outlined,
      label: "user@upi",
      number: "",
      expiry: "",
    ),
  ];

  void _addNewMethod(PaymentItem newItem) {
    setState(() {
      _methods.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Payment Methods',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Saved Payment Methods',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  itemCount: _methods.length + 1,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    if (index < _methods.length) {
                      final method = _methods[index];
                      return Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2F2F2F),
                          borderRadius: BorderRadius.circular(12),
                          border: method.isDefault ? Border.all(color: Colors.green) : null,
                        ),
                        child: Row(
                          children: [
                            Icon(method.icon, color: Colors.white, size: 28),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(method.label,
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                                  if (method.number.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(method.number,
                                          style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                    ),
                                  if (method.expiry.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text("Expires: ${method.expiry}",
                                          style: const TextStyle(color: Colors.white70, fontSize: 12)),
                                    ),
                                  if (method.isDefault)
                                    const Padding(
                                      padding: EdgeInsets.only(top: 4),
                                      child: Text("Default",
                                          style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.w500)),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      // Add new button
                      return GestureDetector(
                        onTap: () {
                          AddCardBottomSheet.show(context, _addNewMethod);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF2F2F2F),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.add, color: Colors.green),
                              SizedBox(width: 12),
                              Text(
                                "Add new Payment Method",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
