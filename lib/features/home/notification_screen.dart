import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

class NotificationScreen extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Ride Confirmed',
      'body': 'Your ride has been confirmed successfully.',
      'time': '5 mins ago',
    },
    {
      'title': 'Payment Received',
      'body': 'You have received ₹200 for your last ride.',
      'time': '15 mins ago',
    },
    {
      'title': 'Profile Updated',
      'body': 'Your profile information was updated.',
      'time': '1 hour ago',
    },
    {
      'title': 'New Feature',
      'body': 'Check out our latest update with new features.',
      'time': 'Yesterday',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: AppColors.primary,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.notifications, color: AppColors.primary),
              title: Text(
                notification['title']!,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(notification['body']!),
              trailing: Text(
                notification['time']!,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
