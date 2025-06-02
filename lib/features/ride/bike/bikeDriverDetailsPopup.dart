import 'package:flutter/material.dart';
import 'package:idhar_udhar/features/ride/bike/chatbikeScreen.dart';

class DriverDetailsPopup extends StatelessWidget {
  const DriverDetailsPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65, 
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Driver details',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Image.asset(
              'assets/images/bike.png',
              height: 70,
            ),
            const SizedBox(height: 8),
            const Text(
              'GJ01L6774',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Ankush  Blue Bajaj CT110',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.message, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChatBikeScreen()),
                    );
                  },
                ),
                const SizedBox(width: 12),
                const Icon(Icons.phone, color: Colors.white),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Icon(Icons.highlight, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Spotlight\nMake your screen flash bright so your driver can find you easily.',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
                Text('Try it',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Row(
                children: const [
                  Icon(Icons.person, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Driver Profile\nLearn more about your driver.',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child:
                    const Text('Close', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
