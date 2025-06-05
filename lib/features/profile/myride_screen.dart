import 'package:flutter/material.dart';



class MyRideScreen extends StatelessWidget {
  final List<Tab> rideTabs = const [
    Tab(text: 'All'),
    Tab(text: 'Upcoming'),
    Tab(text: 'Completed'),
    Tab(text: 'Cancelled'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: rideTabs.length,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('My Ride'),
            centerTitle: true,
            backgroundColor: Colors.black,
            bottom: TabBar(
              tabs: rideTabs,
              indicatorColor: Colors.white, 
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),
              unselectedLabelColor: Colors.grey,
              indicatorSize:TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
              labelColor: Colors.white,
              unselectedLabelStyle:TextStyle(color: Colors.white,fontWeight: FontWeight.w500) ,
              dividerColor: Colors.white,
              indicatorWeight: 0.1,
              indicatorPadding: EdgeInsetsGeometry.directional(bottom: 10),
              indicator: ThinUnderlineIndicator(color: Colors.white, thickness: 1.3),
              tabAlignment: TabAlignment.center,
            ),
          ),
          body: TabBarView(
            children: [
              RideList(category: 'All'),
              RideList(category: 'Upcoming'),
              RideList(category: 'Completed'),
              RideList(category: 'Cancelled'),
            ],
          ),
        ),
      ),
    );
  }
}

class RideList extends StatelessWidget {
  final String category;
  RideList({required this.category});

  final List<Map<String, dynamic>> rides = [
    {
      "title": "GreenBike Ride",
      "date": "15 Jun 2024",
      "price": "₹350",
      "status": "Upcoming",
      "from": "Andheri East",
      "to": "Bandra Kurla Complex"
    },
    {
      "title": "GreenAuto Ride",
      "date": "1 Jun 2024",
      "price": "₹159",
      "status": "Completed",
      "from": "Powai",
      "to": "Vikhroli"
    },
    {
      "title": "GreenCar Ride",
      "date": "1 May 2025",
      "price": "₹159",
      "status": "Cancelled",
      "from": "Powai",
      "to": "Vikhroli"
    },
    {
      "title": "GreenBike Ride",
      "date": "9 Jun 2023",
      "price": "₹159",
      "status": "Cancelled",
      "from": "Powai",
      "to": "Vikhroli"
    },
    {
      "title": "GreenBike Ride",
      "date": "29 May 2022",
      "price": "₹159",
      "status": "Completed",
      "from": "Powai",
      "to": "Vikhroli"
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRides = category == 'All'
        ? rides
        : rides.where((ride) => ride['status'] == category).toList();

    return ListView.builder(
      padding: EdgeInsets.all(12),
      itemCount: filteredRides.length,
      itemBuilder: (context, index) {
        final ride = filteredRides[index];
        return RideCard(ride: ride);
      },
    );
  }
}

class RideCard extends StatelessWidget {
  final Map<String, dynamic> ride;

  RideCard({required this.ride});

  Color getStatusColor(String status) {
    switch (status) {
      case "Completed":
        return Colors.green;
      case "Cancelled":
        return Colors.red;
      case "Upcoming":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData getIcon(String title) {
    if (title.contains('Car')) return Icons.directions_car;
    if (title.contains('Auto')) return Icons.electric_rickshaw;
    return Icons.pedal_bike;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF3A3A3A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Vehicle Icon
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white,
              child: Icon(getIcon(ride['title']), color: Colors.black, size: 20),
            ),
            const SizedBox(width: 12),

            // Ride Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ride['title'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ride['date'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // From and To
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.circle, size: 6, color: Colors.green),
                          const SizedBox(width: 3),
                          Flexible(
                            child: Text(
                              ride['from'],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.green,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.circle, size: 6, color: Colors.red),
                          const SizedBox(width: 3),
                          Flexible(
                            child: Text(
                              ride['to'],
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Price and Status
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ride['price'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: getStatusColor(ride['status']),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    ride['status'],
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class ThinUnderlineIndicator extends Decoration {
  final Color color;
  final double thickness;

  const ThinUnderlineIndicator({required this.color, this.thickness = 0.5});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _ThinUnderlinePainter(color: color, thickness: thickness);
  }
}

class _ThinUnderlinePainter extends BoxPainter {
  final Color color;
  final double thickness;

  _ThinUnderlinePainter({required this.color, required this.thickness});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final double xStart = offset.dx;
    final double xEnd = offset.dx + configuration.size!.width;
    final double y = offset.dy + configuration.size!.height - thickness / 2;

    canvas.drawLine(Offset(xStart, y), Offset(xEnd, y), paint);
  }
}


