import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/features/ride/car/carDriverDetailsPopup.dart';
import 'package:idhar_udhar/features/ride/car/carcancelRidedetail_bottomsheet.dart';

import '../../payment/allpaymentmethods.dart';

class CarRideDetailsPopup extends StatelessWidget {
  final String pin;

  const CarRideDetailsPopup({super.key, this.pin = "5678"});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.05,
      maxChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                const SizedBox(height: 20),

                const Center(
                  child: Column(
                    children: [
                      Text(
                        'Pick-up in 4 min',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Expected arrival by 2:33 PM',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'PIN for this ride',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: List.generate(4, (index) {
                        return Container(
                          width: 30,
                          height: 30,
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            index < pin.length ? pin[index] : '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          'Your driver is arriving soon. Please wait at pickup spot.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showCarRideDetailsSheet(context);
                        },
                        child: const Icon(Icons.more_horiz, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 19),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const CircleAvatar(
                                radius: 26,
                                backgroundImage: AssetImage('assets/images/profile.png'),
                              ),
                              const SizedBox(height: 2),
                              const Text(
                                'Ashutosh',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: MediaQuery.of(context).size.width - 250),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'GJ01XN5412',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                              Text(
                                'White Wagon R',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(buttonBorderRadius),
                    border: Border.all(color: Colors.white),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      const Icon(Icons.message_outlined, color: Colors.white),
                      const SizedBox(width: 15),
                      const Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Send a message',
                            hintStyle: TextStyle(color: Colors.white, fontSize: 15),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          _circleIconButton(Icons.phone, onTap: () {}),
                          const SizedBox(width: 10),
                          _circleIconButton(Icons.more_horiz, onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const CarDriverDetailsPopup(),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const PaymentMethodScreen(),
                      );
                    },
                    child: Text('Pay')
                )
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _circleIconButton(IconData icon, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3),
        ),
        padding: const EdgeInsets.all(3),
        child: Icon(icon, color: Colors.black, size: 15),
      ),
    );
  }
}
