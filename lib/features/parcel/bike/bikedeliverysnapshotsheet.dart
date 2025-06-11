import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

import '../../payment/allpaymentmethods.dart';
class BikeDeliverySnapshotContent extends StatelessWidget {
  const BikeDeliverySnapshotContent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.7, // Fixed but responsive height
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Title
          Center(
            child: Text(
              "Your Delivery Snapshot",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Delivery Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.two_wheeler, color: Colors.white, size: 28),
              const SizedBox(width: 10),
              Expanded(
                child:  Text("Two-Wheeler Courier",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),

              ),
              Column(
                children: [
                  Text("5 june ",
                      style: TextStyle(color: Colors.white,fontSize: 12)),
                  SizedBox(height: 4),
                  Text("28 KM ",
                      style: TextStyle(color: Colors.white,fontSize: 12)),
                ],
              )
            ],
          ),

          const SizedBox(height: 20),

          // Fare breakdown box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: const [
                _FareRow(title: "Base fare", amount: "₹40"),
                _FareRow(title: "Distance Charges", amount: "₹20"),
                _FareRow(title: "Time charge", amount: "₹10"),
                _FareRow(title: "Taxes & fees", amount: "₹9"),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Total fare", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              Text("₹99", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),

          const Spacer(),

          // Proceed button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ButtonBorderRadius),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const PaymentMethodScreen(),
                );
              },
              child: const Text(
                "Proceed to Payment",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FareRow extends StatelessWidget {
  final String title;
  final String amount;

  const _FareRow({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white70)),
          Text(amount, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
