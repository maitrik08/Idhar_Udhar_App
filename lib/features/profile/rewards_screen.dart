import 'package:flutter/material.dart';

class RewardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      'amount': '+500 coins',
      'type': 'credit',
      'title': 'Referred Ramesh',
      'date': '21 June'
    },
    {
      'amount': '-1000 coins',
      'type': 'debit',
      'title': 'Redeemed Free Ride',
      'date': '11 June'
    },
    {
      'amount': '+200 coins',
      'type': 'credit',
      'title': 'Completed 5 rides',
      'date': '10 June'
    },
    {
      'amount': '-500 coins',
      'type': 'debit',
      'title': 'Redeemed Free Ride',
      'date': '9 June'
    },
    {
      'amount': '+200 coins',
      'type': 'credit',
      'title': 'Weekly Bonus',
      'date': '10 June'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: BackButton(color: Colors.white),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCoinBalance(),
            SizedBox(height: 20),
            ...transactions.map((txn) => _buildTransactionCard(txn)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCoinBalance() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/profile/coin.png",
                height: 30,
                width: 30,
                color: Color(0xFFFCC602) ,
              ),
              SizedBox(width: 13),
              Text("You have", style: TextStyle(color: Colors.white70)),
            ],
          ),
          SizedBox(height: 7),
          Text(
            "1200 Coins",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFCC602),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionCard(Map<String, dynamic> txn) {
    final isCredit = txn['type'] == 'credit';
    final amountColor = isCredit ? Color(0xFFFCC602) : Colors.red;
    final amountColortext = isCredit ? Colors.white : Colors.red;

    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/profile/coin.png",
                height: 20,
                width: 20,
                color: amountColor,
              ),
              SizedBox(width: 8),
              Text(
                txn['amount'],
                style: TextStyle(
                  color: amountColortext,
                  fontSize: 10
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            txn['title'],
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 4),
          Text(
            txn['date'],
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
