import 'package:flutter/material.dart';
import '../../../core/themes/colors.dart' show AppColors;

class FAQScreen extends StatefulWidget {
  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> with TickerProviderStateMixin {
  final List<Map<String, String>> faqList = [
    {
      "question": "What Makes A Good Taxi Service?",
      "answer": "A good taxi service is reliable, safe, clean, and provides good customer support"
    },
    {
      "question": "What Is The Purpose Of A Taxi Service?",
      "answer": "A good taxi service is reliable, safe, clean, and provides good customer support"
    },
    {
      "question": "How to download the IdharUdhar app?",
      "answer": "You can download the app from Google Play Store or Apple App Store."
    },
    {
      "question": "What Should I Be Asking For First Ride?",
      "answer": "You can ask about fare, estimated time, and safety features."
    },
    {
      "question": "How many cars does IdharUdhar have?",
      "answer": "We have hundreds of cars available in multiple cities."
    },
    {
      "question": "Are the drivers background checked?",
      "answer": "Yes, all drivers go through strict background checks before onboarding."
    },
    {
      "question": "Can I pay by cash or card?",
      "answer": "Yes, both cash and card payments are accepted."
    },
    {
      "question": "What is the cancellation policy?",
      "answer": "You can cancel your ride anytime before pickup without penalty."
    },
    {
      "question": "Is there a loyalty or rewards program?",
      "answer": "Yes, we offer reward points for regular customers."
    },
    {
      "question": "How do I contact customer support?",
      "answer": "You can contact us via the Help section in the app or call our hotline."
    },
  ];

  int? expandedIndex;
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      faqList.length,
          (_) => AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      ),
    );

    _animations = _controllers
        .map((controller) =>
        CurvedAnimation(parent: controller, curve: Curves.easeInOut))
        .toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _toggleExpand(int index) {
    setState(() {
      if (expandedIndex == index) {
        _controllers[index].reverse();
        expandedIndex = null;
      } else {
        if (expandedIndex != null) {
          _controllers[expandedIndex!].reverse();
        }
        expandedIndex = index;
        _controllers[index].forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Frequently Asked Questions",
            style: TextStyle(color: Colors.white, fontSize: 18)),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemBuilder: (context, index) {
          bool isExpanded = expandedIndex == index;

          return GestureDetector(
            onTap: () => _toggleExpand(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2C2C2C),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          faqList[index]["question"]!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontFamily: 'lexend',
                          ),
                        ),
                      ),
                      AnimatedCrossFade(
                        duration: const Duration(milliseconds: 300),
                        firstChild:
                        Icon(Icons.add, color: AppColors.primary, size: 24),
                        secondChild:
                        Icon(Icons.remove, color: AppColors.primary, size: 24),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                      ),
                    ],
                  ),
                  SizeTransition(
                    sizeFactor: _animations[index],
                    axisAlignment: -1.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        faqList[index]["answer"]!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 10,
                          fontFamily: 'lexend',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
