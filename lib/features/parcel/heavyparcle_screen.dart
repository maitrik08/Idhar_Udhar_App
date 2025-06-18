import 'package:flutter/material.dart';
import '../../core/constants/constants.dart';
import '../../shared/widgets/vehiclecard.dart';

class HeavyParcelSelectionScreen extends StatelessWidget {
  const HeavyParcelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              // Header with center-aligned title and back icon
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: const Text(
                  "Heavy or Light, We’ve Got the Right Ride",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),

              Expanded(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        rideType = 'tata-ace';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/1.png',
                        title: "Tata Ace",
                        weight: "600–750 kg",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                    InkWell(
                      onTap:() {
                        rideType = 'Pickup-Truck';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/2.png',
                        title: "Pickup Truck",
                        weight: "1000–1200 kg",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                    InkWell(
                      onTap:() {
                        rideType = 'mini-Truck';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/3.png',
                        title: "Mini Truck",
                        weight: "2500–3000 kg",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                    InkWell(
                      onTap:() {
                        rideType = 'tempo';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/4.png',
                        title: "Tempo",
                        weight: "500–600 kg",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                    InkWell(
                      onTap:() {
                        rideType = 'canter';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/5.png',
                        title: "Canter",
                        weight: "4 to 7 Ton",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                    InkWell(
                      onTap:() {
                        rideType = '14feet-truck';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/6.png',
                        title: "14 Feet Truck",
                        weight: "8–9 Ton",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                    InkWell(
                      onTap:() {
                        rideType = '19feet-truck';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/7.png',
                        title: "19 Feet Truck",
                        weight: "10–11 Ton",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                    InkWell(
                      onTap:() {
                        rideType = 'duty-truck';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/8.png',
                        title: "Medium Duty Truck",
                        weight: "15–16 Ton",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                    InkWell(
                      onTap:() {
                        rideType = '32feet-truck';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/9.png',
                        title: "32 Feet Multi Axle Truck",
                        weight: "20–28 Ton",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                    InkWell(
                      onTap:() {
                        rideType = 'container-truck';
                        Navigator.pushNamed(context, '/chooseparcelthing');
                      },
                      child: const VehicleCard(
                        imagePath: 'assets/images/delivery/vehicle/10.png',
                        title: "Container Truck",
                        weight: "10–20 Ton",
                      ),
                    ),
                    SizedBox(height: size.height*0.017,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
