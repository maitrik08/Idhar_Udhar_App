import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double sectionTitlefontsize = size.height*0.0165;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1E2E1E),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        onTap: _onBottomNavTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.directions_car), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top search + notification icon
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.black),
                          SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height*0.019
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.notifications, color: Colors.black),
                  ),
                ],
              ),

              SizedBox(height: 20),
              sectionTitle('Ride in Comfort',sectionTitlefontsize),
              SizedBox(height: 10),
              roundedImage('assets/images/home/car.png', size),

              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        sectionTitle('Swift Rides, Zero Wait',sectionTitlefontsize),
                        SizedBox(height: 10),
                        roundedImage('assets/images/home/bike.png', size),
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        sectionTitle('Swift Rides, Zero Wait',sectionTitlefontsize),
                        SizedBox(height: 10),
                        roundedImage('assets/images/home/bag.png', size),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              sectionTitle("Hungry? We've Got You",sectionTitlefontsize),
              SizedBox(height: 10),
              roundedImage('assets/images/home/burger.png', size),

              SizedBox(height: 16),
              sectionTitle('Deliver Anything, Anytime',sectionTitlefontsize),
              SizedBox(height: 10),
              roundedImage('assets/images/home/delivery.png', size),

              SizedBox(height: 16),
              sectionTitle('Your Ride, Your Way',sectionTitlefontsize),
              SizedBox(height: 1),
              Text(
                'We get it done – that’s Idhar Udhar for you',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: size.width * 0.03,
                ),
              ),
              SizedBox(height: 10,),
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  rideTile('Bike Ride', 'assets/images/home/bike1.png'),
                  rideTile('Car Ride', 'assets/images/home/car1.png'),
                  rideTile('Auto Ride', 'assets/images/home/auto.png'),
                  rideTile('Send a Parcel', 'assets/images/home/parcel.png'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionTitle(String title,double fontSize) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize:fontSize,
        fontWeight: FontWeight.w500
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
            style: TextStyle(
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
            width: 30,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40)
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(
                  'assets/images/icons/right-arrow.png'
              ),
            ),
          ),
        ),
      ],
    );
  }
}
