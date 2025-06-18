import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/core/themes/colors.dart';
import 'package:idhar_udhar/features/profile/paymentsetting_screen.dart';

class AddCardBottomSheet {
  static void show(BuildContext context, void Function(PaymentItem) onAdd) {
    final cardNumberController = TextEditingController();
    final nameController = TextEditingController();
    final expiryController = TextEditingController();
    final cvvController = TextEditingController();

    final formKey = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: MediaQuery.of(context).size.width * 0.4,
          ),
          curve: Curves.easeOut,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
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
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(height: 20),
                      _buildInput(
                        "Card Number",
                        controller: cardNumberController,
                        hint: "1234 5678 9012 3456",
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) return "Card number is required";
                          final cleaned = value.replaceAll(' ', '');
                          if (cleaned.length != 16) return "Card number must be 16 digits";
                          if (!RegExp(r'^[0-9]+$').hasMatch(cleaned)) return "Only digits allowed";
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          CardNumberFormatter(),
                        ],
                      ),
                      const SizedBox(height: 12),
                      _buildInput(
                        "Card Holder Name",
                        controller: nameController,
                        hint: "John Doe",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) return "Name is required";
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildInput(
                              "Expiry Date",
                              controller: expiryController,
                              hint: "MM/YY",
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) return "Expiry date required";
                                if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(value)) {
                                  return "Enter a valid expiry date in MM/YY";
                                }
                                return null;
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                                ExpiryDateFormatter(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildInput(
                              "CVV",
                              controller: cvvController,
                              hint: "123",
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) return "CVV required";
                                if (!RegExp(r'^[0-9]{3}$').hasMatch(value)) return "Must be 3 digits";
                                return null;
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(3),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(buttonBorderRadius),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final item = PaymentItem(
                                icon: Icons.credit_card_outlined,
                                label: nameController.text.trim(),
                                number: cardNumberController.text.isNotEmpty
                                    ? "•••• ${cardNumberController.text.trim().replaceAll(' ', '').substring(12)}"
                                    : "",
                                expiry: expiryController.text.trim(),
                                isDefault: false,
                              );
                              Navigator.pop(context);
                              onAdd(item);
                            }
                          },
                          child: const Text(
                            "Add Payment Method",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildInput(
      String label, {
        String? hint,
        TextEditingController? controller,
        TextInputType keyboardType = TextInputType.text,
        String? Function(String?)? validator,
        List<TextInputFormatter>? inputFormatters,
      }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black)),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          validator: validator,
          style: const TextStyle(color: Colors.black, fontSize: 14),
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
      ],
    );
  }
}

// Formats: 1234567812345678 => 1234 5678 1234 5678
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i != 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(digitsOnly[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

// Formats: 1225 => 12/25
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (text.length > 2) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
