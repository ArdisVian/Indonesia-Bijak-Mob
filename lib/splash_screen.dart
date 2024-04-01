import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:indonesia_bijak/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
            child: LottieBuilder.network(
                'https://lottie.host/bf4ada78-bd6b-4f4c-b319-f5e4ab509454/PcxiiwYPw7.json'),
          )
        ],
      ),
      nextScreen: IndonesiaBijakHomePage(),
      splashIconSize: 700,
      backgroundColor: const Color.fromARGB(255, 255, 132, 132),
    );
  }
}
