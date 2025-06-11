import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';


class RewardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCoinBalance(),
              SizedBox(height: 16),
              _buildLevelProgress(),
              SizedBox(height: 24),
              Text("Earn More Coins", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              _buildTaskItem("Book 3 Rides", "200 coins", "1/3", Icons.directions_car),
              _buildTaskItem("Refer Friends", "500 coins", "0/1", Icons.group),
              _buildTaskItem("Complete Profile", "100 coins", "80%", Icons.person),
              SizedBox(height: 24),
              Text("Available Rewards", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              _buildRewardItem("Free Ride", "1000 coins", Icons.local_taxi),
              _buildRewardItem("₹100 Cashback", "800 coins", Icons.wallet_giftcard),
              _buildRewardItem("Idhar T-Shirt", "1500 coins", Icons.emoji_people),
              SizedBox(height: 24),
              _buildInviteSection(),
              SizedBox(height: 24),
              Text("Achievements", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              _buildAchievements(),
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildCoinBalance() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xff2a2800),
            radius: 25,
            child: Image.asset("assets/images/profile/coin.png",height: 30,width: 30,),
          ),
          SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("You have", style: TextStyle(fontSize: 16)),
              Text("1,200 Idhar Coins", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLevelProgress() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Level 2 – Explorer", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          LinearProgressIndicator(value: 0.68, color: AppColors.primary),
          SizedBox(height: 4),
          Text("320 coins to Level 3", style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildTaskItem(String title, String reward, String progress, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          CircleAvatar(
              backgroundColor: Color(0xff2a2800),
              child: Icon(icon, color: Colors.amber)
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$title", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                Text("$reward", style: TextStyle(fontSize: 14,color: Colors.white70)),
              ],
            ),
          ),
          Text(progress, style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildRewardItem(String title, String cost, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Color(0xff2a2800),
            child: Icon(icon, color: Colors.amber),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500)),
                Row(
                  children: [
                    Image.asset('assets/images/profile/coin.png', scale: 22),
                    SizedBox(width: 4),
                    Text(cost, style: TextStyle(fontSize: 14,color: Colors.white70)),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              minimumSize: Size(0, 0), // Shrinks to fit content
              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Removes extra padding
              textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold), // Smaller font
            ),
            child: Text("Redeem"),
          ),
        ],
      ),
    );
  }


  Widget _buildInviteSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Invite Friends", style: TextStyle(fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.share, color: Colors.amber),
            ],
          ),
          SizedBox(height: 8),
          Text("Get 500 coins for each friend"),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero, // Remove default padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.transparent, // Make button background transparent
              shadowColor: Colors.transparent,     // Optional: remove shadow
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber.shade500,
                    Colors.amber.shade600,
                  ], // Customize colors here
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                alignment: Alignment.center,
                child: Text(
                  "Share Invite Code",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildAchievements() {
    final List<IconData> icons = [
      Icons.emoji_events,
      Icons.star,
      Icons.flash_on,
      Icons.verified
    ];
    final List<String> titles = [
      "First Ride",
      "Top Rated",
      "Speed Demon",
      "VIP Status"
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(icons.length, (index) {
        return SizedBox(
          width: 80, // Ensures equal width for all items
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xff2a2800),
                child: Icon(
                  icons[index],
                  color: Colors.amber,
                  size: 35,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                height: 45,
                child: Text(
                  titles[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }


  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.grey[900],
      borderRadius: BorderRadius.circular(16),
    );
  }
}
