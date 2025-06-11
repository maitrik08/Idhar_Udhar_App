import 'package:flutter/material.dart';
import '../../../core/constants/constants.dart';
import '../../../core/themes/colors.dart';

class NoCarDriverScreen extends StatefulWidget {
  const NoCarDriverScreen({super.key});

  @override
  State<NoCarDriverScreen> createState() => _NoCarDriverScreenState();
}

class _NoCarDriverScreenState extends State<NoCarDriverScreen> {
  int? selectedAmount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Back Arrow
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            // Main content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),

                    // Title
                    Text(
                      "No driver has accepted your request yet.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Subtitle
                    Text(
                      "Add ₹10 to your request to increase your chances of getting a driver.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: size.width * 0.038,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // ₹10 and ₹20 Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [10, 20].map((amount) {
                        final isSelected = selectedAmount == amount;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                selectedAmount = amount;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: isSelected ? AppColors.primary : Colors.white,
                              ),
                              backgroundColor: isSelected
                                  ? AppColors.primary
                                  : Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              child: Text(
                                '₹$amount',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: size.width * 0.045,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const Spacer(),

                    // Add and Get a driver button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: selectedAmount != null
                            ? () {
                          Navigator.pushNamed(context, '/searchcardriver');
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(ButtonBorderRadius),
                          ),
                        ),
                        child: Text(
                          "Add ₹${selectedAmount ?? 10} and Get a driver",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // No I don't pay button
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // Skip payment logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(ButtonBorderRadius),
                          ),
                        ),
                        child: const Text(
                          "NO, I Don’t Pay",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
