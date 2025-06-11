import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/features/ride/bike/bikeDriverDetailsPopup.dart';
import 'package:idhar_udhar/features/ride/car/carDriverDetailsPopup.dart';

import 'carcancelRidedetail_bottomsheet.dart' show showCarRideDetailsSheet;

class CarRideDetailsPopup extends StatelessWidget {
  final String pin;

  const CarRideDetailsPopup({super.key, this.pin = "1234"});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.64,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          const SizedBox(height: 12),

          // Pickup info
          const Center(
            child: Column(
              children: [
                Text(
                  'Pick-up in 5 min',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Expected arrival by 2:35 PM',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // PIN
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
          const SizedBox(height: 20),

          // Ride message container
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header + More button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Ride details',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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
                const SizedBox(height: 8),
                const Text(
                  'Your driver is on the way — be at the pickup spot',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Driver Info Card
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
                        SizedBox(height: 2,),
                        Text(
                          'Ashutosh',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width-250,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        SizedBox(height: 4),
                        Text(
                          'GJ01XN5412',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          'Black Honda SP 125',
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
          const SizedBox(height: 12),

          // Message Input
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(ButtonBorderRadius),
              border: Border.all(color: Colors.white)
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Icon(Icons.message, color: Colors.white70),
                const SizedBox(width: 15),
                const Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Send a message',
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.all(0),
                          child: Icon(Icons.phone, color: Colors.black,size: 15,),
                        )
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) =>  CarDriverDetailsPopup(),
                        );
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)
                          ),
                          child:  Padding(
                            padding: const EdgeInsets.all(0),
                            child: Icon(Icons.more_horiz, color: Colors.black,size: 15,),
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
