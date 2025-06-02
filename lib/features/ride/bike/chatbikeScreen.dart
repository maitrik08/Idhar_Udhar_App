import 'package:flutter/material.dart';

class ChatBikeScreen extends StatelessWidget {
  const ChatBikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/driver_avatar.png'),
              radius: 20,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ethan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth < 360 ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Driver',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: screenWidth < 360 ? 10 : 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildDriverMessage(
                  screenWidth,
                  'I\'m on my way, see you soon!',
                  'assets/images/driver_avatar.png',
                ),
                const SizedBox(height: 12),
                _buildUserMessage(
                  screenWidth,
                  'Great, I\'ll be waiting outside.',
                  'assets/images/user_avatar.png',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            color: Colors.black,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 83, 75, 75),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      style: TextStyle(
                        fontSize: screenWidth < 360 ? 12 : 14,
                        color: Colors.white,
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(color: Colors.white54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.send, color: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDriverMessage(double screenWidth, String text, String avatarPath) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(avatarPath),
          radius: 16,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: screenWidth < 360 ? 12 : 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserMessage(double screenWidth, String text, String avatarPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth < 360 ? 12 : 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          backgroundImage: AssetImage(avatarPath),
          radius: 16,
        ),
      ],
    );
  }
}
