import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/features/ride/car/carDriverDetailsPopup.dart';
import 'package:idhar_udhar/features/ride/car/carcancelRidedetail_bottomsheet.dart';

class CarRideDetailsPopup extends StatelessWidget {
  final String pin;

  const CarRideDetailsPopup({super.key, this.pin = "5678"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6, // ✅ Fixed height
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          // Grip bar
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
          const SizedBox(height: 12),

          // Ride Status
          const Column(
            children: [
              Text(
                'Pick-up in 4 min',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Expected arrival by 2:33 PM',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // PIN Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('PIN for this ride',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
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
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Ride Details Box
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
                    style: TextStyle(color: Colors.black87, fontSize: 14),
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
          const SizedBox(height: 12),

          // Driver Info
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ashutosh',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black87),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'GJ01XN5412',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black54),
                    ),
                    Text(
                      'White Wagon R',
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Message + Actions
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(buttonBorderRadius),
              border: Border.all(color: Colors.white),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(Icons.message, color: Colors.white70),
                const SizedBox(width: 12),
                const Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Send a message',
                      hintStyle: TextStyle(color: Colors.white54),
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
        ],
      ),
    );
  }

  Widget _circleIconButton(IconData icon, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(4),
        child: Icon(icon, color: Colors.black, size: 16),
      ),
    );
  }
}
