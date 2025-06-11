import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/delivery/maindelivery_screen.dart';

import '../../core/constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double sectionTitleFontSize = size.height * 0.0165;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.002),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.black),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.019,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.notifications, color: Colors.black),
                ),
              ],
            ),

            const SizedBox(height: 20),
            sectionTitle('Ride in Comfort', sectionTitleFontSize),
            const SizedBox(height: 10),
            InkWell(
                onTap:() {
                  Navigator.pushNamed(context, '/selectcarlocation');
                  RideType = "car";
                  print(RideType);
                },
                child: roundedImage('assets/images/home/car.png', size)),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      sectionTitle('Swift Rides, Zero Wait', sectionTitleFontSize),
                      const SizedBox(height: 10),
                      InkWell(
                          onTap:() {
                            Navigator.pushNamed(context, '/selectbikelocation');
                            RideType = "car";
                            print(RideType);
                          },
                          child: roundedImage('assets/images/home/bike.png', size)),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    children: [
                      sectionTitle('Swift Rides, Zero Wait', sectionTitleFontSize),
                      const SizedBox(height: 10),
                      InkWell(
                          onTap:() {
                            Navigator.push(context,MaterialPageRoute(builder: (_) => Scaffold(body: DeliveryScreen())) );
                          },
                          child: roundedImage('assets/images/home/bag.png', size)
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),
            sectionTitle("Hungry? We've Got You", sectionTitleFontSize),
            const SizedBox(height: 10),
            InkWell(
                onTap:() {
                  Navigator.push(context,MaterialPageRoute(builder: (_) => Scaffold(body: DeliveryScreen())) );
                },
                child: roundedImage('assets/images/home/burger.png', size)),

            const SizedBox(height: 16),
            sectionTitle('Deliver Anything, Anytime', sectionTitleFontSize),
            const SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/selectparceltype');
              },
                child: roundedImage('assets/images/home/delivery.png', size)
            ),

            const SizedBox(height: 16),
            sectionTitle('Your Ride, Your Way', sectionTitleFontSize),
            const SizedBox(height: 1),
            Text(
              'We get it done – that’s Idhar Udhar for you',
              style: TextStyle(
                color: Colors.white70,
                fontSize: size.width * 0.03,
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: [
                InkWell(
                    onTap:() {
                      Navigator.pushNamed(context, '/selectbikelocation');
                      RideType = "bike";
                      print(RideType);
                    },
                    child: rideTile('Bike Ride', 'assets/images/home/bike1.png')
                ),
                InkWell(
                    onTap:() {
                      Navigator.pushNamed(context, '/selectcarlocation');
                      RideType = "car";
                      print(RideType);
                    },
                    child: rideTile('Car Ride', 'assets/images/home/car1.png')
                ),
                InkWell(
                    onTap:() {
                      Navigator.pushNamed(context, '/selectautolocation');
                      RideType = "auto";
                      print(RideType);
                    },
                    child: rideTile('Auto Ride', 'assets/images/home/auto.png')
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/selectparceltype');
                    },
                    child: rideTile('Send a Parcel', 'assets/images/home/parcel.png')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title, double fontSize) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget roundedImage(String path, Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        path,
        height: size.height * 0.22,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget rideTile(String title, String path) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            path,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.5), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 10,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            width: 25,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.5),
              child: Image.asset('assets/images/icons/right-arrow.png'),
            ),
          ),
        ),
      ],
    );
  }
}
