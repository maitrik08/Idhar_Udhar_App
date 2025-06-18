import 'package:flutter/material.dart';

import '../../../core/themes/colors.dart' show AppColors;

class SupportChatScreen extends StatefulWidget {
  @override
  _SupportChatScreenState createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      'text': "Hello! I’m your support agent. How can I help you today?",
      'time': "12:45 PM",
      'isAgent': true,
    }
  ];
  final TextEditingController controller = TextEditingController();

  void sendMessage() {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({
          'text': text,
          'time': TimeOfDay.now().format(context),
          'isAgent': false,
        });
      });
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text("Support Center", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400)),
                  SizedBox(height: 6),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.0),
                    child: Text("Get help with your account, rides, and payments",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                  SizedBox(height: 56),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 20),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Icon(Icons.circle, size: 10, color: Color(0xFF00C853)),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Agent is online", style: TextStyle(color: Colors.white)),
                          SizedBox(width: 8),
                          Text("Typically replies in a few minutes",
                              style: TextStyle(color: Colors.white60, fontSize: 12)),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (msg['isAgent'])
                          const CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage("assets/images/profile.png"), // Add your agent image
                          )
                        else
                          const SizedBox(width: 32),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color(0xFF2C2C2C),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(16),
                                      bottomRight: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                  ),
                                ),
                                child: Text(
                                  msg['text'],
                                  style:  TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width * 0.035),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                msg['time'],
                                style: const TextStyle(
                                  color: Colors.white38,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Colors.black,
              // ❌ Don't wrap in Expanded here
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2C2C),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: "Type your message...",
                          hintStyle: TextStyle(color: Colors.white60, fontSize: 12),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: sendMessage,
                      child: Icon(Icons.send, color: AppColors.primary, size: 20),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
