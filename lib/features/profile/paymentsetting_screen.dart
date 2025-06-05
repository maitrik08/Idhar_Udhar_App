import 'package:flutter/material.dart';

class PaymentSettingScreen extends StatefulWidget {
  const PaymentSettingScreen({super.key});

  @override
  State<PaymentSettingScreen> createState() => _PaymentSettingScreenState();
}

class _PaymentSettingScreenState extends State<PaymentSettingScreen> {
  final List<_PaymentItem> _methods = [
    _PaymentItem(icon: Icons.credit_card_outlined, label: "Credit/Debit Card"),
    _PaymentItem(icon: Icons.currency_rupee, label: "UPI"),
    _PaymentItem(icon: Icons.account_balance_wallet_outlined, label: "Wallet"),
  ];

  void _editMethod(int index) {
    final controller = TextEditingController(text: _methods[index].label);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1C1C1C),
          title: const Text("Edit Method", style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Enter method name",
              hintStyle: TextStyle(color: Colors.white54),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white30),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _methods[index] = _PaymentItem(
                    icon: _methods[index].icon,
                    label: controller.text,
                  );
                });
                Navigator.pop(context);
              },
              child: const Text("Save", style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  void _addNewMethod() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1C1C1C),
          title: const Text("Add New Method", style: TextStyle(color: Colors.white)),
          content: TextField(
            controller: controller,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: "Enter method name",
              hintStyle: TextStyle(color: Colors.white54),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white30),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _methods.add(_PaymentItem(
                    icon: Icons.payment, // Default icon
                    label: controller.text,
                  ));
                });
                Navigator.pop(context);
              },
              child: const Text("Add", style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
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
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Saved Payment Methods',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
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
                        decoration: BoxDecoration(
                          color: const Color(0xFF1C1C1C),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(9),
                                child: Icon(method.icon, color: Colors.white),
                              ),
                            ),
                            title: Text(
                              method.label,
                              style: const TextStyle(color: Colors.white,fontSize: 14),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.edit_outlined, color: Colors.white),
                              onPressed: () => _editMethod(index),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: _addNewMethod,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF1C1C1C),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const ListTile(
                            leading: Icon(Icons.add, color: Colors.white),
                            title: Text(
                              "Add New Method",
                              style: TextStyle(color: Colors.white),
                            ),
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

class _PaymentItem {
  final IconData icon;
  final String label;

  const _PaymentItem({required this.icon, required this.label});
}
