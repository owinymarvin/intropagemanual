import 'package:flutter/material.dart';
import 'package:page/screens/intro/intro_screen_four.dart';
import 'package:page/screens/intro/intro_screen_one.dart';
import 'package:page/screens/intro/intro_screen_three.dart';
import 'package:page/screens/intro/intro_screen_two.dart';
import 'package:page/screens/welcome/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: const [
              IntroScreenOne(),
              IntroScreenTwo(),
              IntroScreenThree(),
              IntroScreenFour(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) => const WelcomeScreen()),
                    );
                  },
                  child: const Text('Skip'),
                ),
                SmoothPageIndicator(controller: _controller, count: 4),
                GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInCirc,
                    );
                    if (onLastPage) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (ctx) => const WelcomeScreen()),
                      );
                    }
                  },
                  child: onLastPage ? const Text('Done') : const Text('Next'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
