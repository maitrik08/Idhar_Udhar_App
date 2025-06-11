import 'package:flutter/material.dart';
import 'package:idhar_udhar/core/constants/constants.dart';
import 'package:idhar_udhar/core/themes/colors.dart';

class AvatarSelectionScreen extends StatefulWidget {
  @override
  _AvatarSelectionScreenState createState() => _AvatarSelectionScreenState();
}

class _AvatarSelectionScreenState extends State<AvatarSelectionScreen> {
  int? selectedIndex;

  // Dummy avatar list (replace with your asset/network images)
  final List<String> avatars = List.generate(
    12,
        (index) => 'assets/images/avtars/${index + 1}.png', // Example path
  );

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 400;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(color: Colors.white),
        title: const Text(
          'Select Avatar',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                itemCount: avatars.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isSmallScreen ? 2 : 3,
                  crossAxisSpacing: 45,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final avatar = avatars[index];
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: isSelected ? Colors.green : Colors.grey[800],
                      child: CircleAvatar(
                        radius: 66,
                        backgroundImage: AssetImage(avatar),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedIndex != null
                    ? () {
                  // Handle avatar selection
                  final selectedAvatar = avatars[selectedIndex!];
                  Navigator.pop(context, selectedAvatar);
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ButtonBorderRadius),
                  ),
                ),
                child: const Text(
                  "Select",
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
