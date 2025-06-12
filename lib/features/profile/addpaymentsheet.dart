import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class PaymentItem {
  final IconData icon;
  final String label;
  final String number;
  final String expiry;
  final bool isDefault;

  const PaymentItem({
    required this.icon,
    required this.label,
    required this.number,
    required this.expiry,
    this.isDefault = false,
  });
}

/// Bottom Sheet to Add Payment Method
class AddCardBottomSheet {
  static void show(BuildContext context, Function(PaymentItem) onAdd) {
    final cardNumberController = TextEditingController();
    final nameController = TextEditingController();
    final expiryController = TextEditingController();
    final cvvController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      isDismissible: true,
      enableDrag: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.67,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Add Payment Method",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
                ),
                const SizedBox(height: 20),
                _buildInput("Card Number", controller: cardNumberController, hint: "1234 5678 9012 3456"),
                const SizedBox(height: 12),
                _buildInput("Card Holder Name", controller: nameController, hint: "John Doe"),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildInput("Expiry Date", controller: expiryController, hint: "MM/YY")),
                    const SizedBox(width: 12),
                    Expanded(child: _buildInput("CVV", controller: cvvController, hint: "123")),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(buttonBorderRadius),
                      ),
                    ),
                    onPressed: () {
                      final item = PaymentItem(
                        icon: Icons.credit_card_outlined,
                        label: nameController.text,
                        number: cardNumberController.text.isNotEmpty
                            ? "•••• ${cardNumberController.text.trim().split(' ').last}"
                            : "",
                        expiry: expiryController.text.trim(),
                        isDefault: false,
                      );
                      Navigator.pop(context);
                      onAdd(item); // Pass item to parent
                    },
                    child: const Text(
                      "Add Payment Method",
                      style: TextStyle(fontSize: 16,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildInput(String label, {String? hint, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black)),
        const SizedBox(height: 6),
        TextField(
          style: TextStyle(color: Colors.black,fontSize: 14),
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black38,fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ],
    );
  }
}

