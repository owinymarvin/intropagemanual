import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
      reverseDuration: const Duration(seconds: 2),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  bool bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (bookmarked == false) {
              bookmarked = true;
              _animationController.forward();
            } else {
              bookmarked = false;
              _animationController.reverse();
            }
          },
          child: Lottie.asset(
            'assets/lottie/washing_machines.json',
            controller: _animationController,
          ),
        ),
      ),
    );
  }
}
