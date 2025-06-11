import 'dart:async';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/themes/colors.dart';

class SearchingCarDriverScreen extends StatefulWidget {
  const SearchingCarDriverScreen({super.key});

  @override
  State<SearchingCarDriverScreen> createState() => _SearchingCarDriverScreenState();
}

class _SearchingCarDriverScreenState extends State<SearchingCarDriverScreen> {
  Duration _timeLeft = const Duration(minutes: 4);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft.inSeconds == 0) {
        timer.cancel();
        _onTimerComplete();
      } else {
        setState(() {
          _timeLeft = _timeLeft - const Duration(seconds: 1);
        });
      }
    });
  }

  void _onTimerComplete() {
    // Handle auto-cancel logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Request auto-cancelled. No driver found.")),
    );
    Navigator.pushNamed(context, '/nocardriver'); // Or navigate to another screen
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _cancelRide() {
    _timer?.cancel();
    Navigator.pop(context); // Or handle cancel logic
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _timeLeft.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = _timeLeft.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 1),
              const Text(
                "Looking for a Driver....",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTimeBox(minutes, "Minutes"),
                  const SizedBox(width: 20),
                  _buildTimeBox(seconds, "Seconds"),
                ],
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "If no driver was found in 4 minutes, this request will be auto-cancelled",
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(flex: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _cancelRide,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ButtonBorderRadius),
                      ),
                    ),
                    child: const Text(
                      "Cancel Request",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        floatingActionButton:Container(
          padding: EdgeInsets.all(90),
          //width:MediaQuery.of(context).size.width-100,
          child:TextButton(
            onPressed: () {
              _timer?.cancel();
              Navigator.pushNamed(context, '/confirmcarpickup');
            },
            child: Text('pickup'),
          ),
        )
    );
  }

  Widget _buildTimeBox(String value, String label) {
    return Column(

      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}
