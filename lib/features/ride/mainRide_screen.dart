import 'package:flutter/material.dart';

import '../../shared/widgets/searchbar.dart';

class RideScreen extends StatelessWidget {
  const RideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double cardSize = size.height*0.2;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.0055+16),
              CustomSearchBar(),
              const SizedBox(height: 24),
              const Text(
                "Choose Your Ride",
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text(
                "Fast. Reliable. All Your Travel Needs in One App.",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
              const SizedBox(height: 20),
              InkWell(
                 onTap:() {
                   Navigator.pushNamed(context, '/selectbikelocation');
                 },
                  child: buildRideOption("Zip Through Traffic", "assets/images/ride/bike.png",cardSize)
              ),
              InkWell(
                  onTap:() {
                    Navigator.pushNamed(context, '/selectcarlocation');
                  },
                  child: buildRideOption("Ride in Comfort", "assets/images/ride/car.png",cardSize)
              ),
              InkWell(
                onTap:() {
                  Navigator.pushNamed(context, '/selectautolocation');
                },
                child:buildRideOption("Go Local, Go Easy", "assets/images/ride/auto.png",cardSize),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildRideOption(String title, String imagePath,double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
