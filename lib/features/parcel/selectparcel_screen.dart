import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';

import '../../shared/widgets/vehiclecard.dart';
class ParcelSelectionScreen extends StatelessWidget {
  const ParcelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select a vehicle based on your parcel’s size and weight.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                ),
              ),



              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  rideType='bike-parcel';
                  Navigator.pushNamed(context, '/chooseparcelthing');
                },
                child: VehicleCard(
                  imagePath: 'assets/images/delivery/vehicle/bike.png',
                  title: "Quick & Light",
                  subtitle:
                  "Ideal for small parcels, documents, or lightweight items.",
                  weight: "Max 10 KG",
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  rideType='car-parcel';
                Navigator.pushNamed(context, '/chooseparcelthing');},
                child: VehicleCard(
                  imagePath: 'assets/images/delivery/vehicle/car.png',
                  title: "Medium & Safe",
                  subtitle:
                  "Perfect for electronics, boxes, and mid-size deliveries.",
                  weight: "Max 50 KG",
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  rideType='auto-parcel';
                  Navigator.pushNamed(context, '/chooseparcelthing');
                },
                child: VehicleCard(
                  imagePath: 'assets/images/delivery/vehicle/auto.png',
                  title: "Spacious & Strong",
                  subtitle:
                  "Best for furniture, heavier goods, or stacked parcels.",
                  weight: "Max 80 KG",
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () {
                  rideType='truck-parcel';
                  Navigator.pushNamed(context, '/heavyparceltype');
                },
                child: VehicleCard(
                  imagePath: 'assets/images/delivery/vehicle/truck.png',
                  title: "Heavy Duty",
                  subtitle:
                  "For bulk deliveries, industrial items, or extra-large loads.",
                  weight: "Max 1000 KG",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



