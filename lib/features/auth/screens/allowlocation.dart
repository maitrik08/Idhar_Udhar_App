import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

void main() => runApp(AllowLocationScreen());

class AllowLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationUIScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LocationUIScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false, // prevents bottom container from moving
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/images/locationboy.png',
                width: size.width,
              ),
            ),

            // Overlaying content
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).padding.top + 20),

                  // Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: size.height * 0.048,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search your location',
                          hintStyle: TextStyle(color: Colors.white70),
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          border: InputBorder.none,
                        ),
                        style: TextStyle(color: Colors.white, fontSize: size.height * 0.018),
                      ),
                    ),
                  ),

                  Spacer(),

                  // Bottom fixed container
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.9),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _optionTile(Icons.add, 'Add New Address'),
                        const SizedBox(height: 10),
                        _optionTile(Icons.import_export, 'Import from other apps', subtitle: '(Rapido, Uber)'),
                        const SizedBox(height: 20),
                        Text('Saved Address', style: TextStyle(color: Colors.white, fontSize: 16)),
                        const SizedBox(height: 10),
                        _optionTile(Icons.home, 'Home', subtitle: 'Red and White Multimedia Education'),
                        _optionTile(Icons.work, 'Work', subtitle: '5678 Oak Ave, Shelbyville'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _optionTile(IconData icon, String title, {String? subtitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(color: Colors.white, fontSize: 15)),
              if (subtitle != null)
                Text(subtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}
