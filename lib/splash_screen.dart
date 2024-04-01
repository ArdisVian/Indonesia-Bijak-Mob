import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:indonesia_bijak/main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.network(
            'https://lottie.host/bf4ada78-bd6b-4f4c-b319-f5e4ab509454/PcxiiwYPw7.json',
            height: 300,
            width: 300,
          ),
          SizedBox(height: 20), // Jarak antara animasi dan teks
          Text(
            'INDONESIA BIJAK',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
      nextScreen: IndonesiaBijakHomePage(),
      splashIconSize: 700,
      backgroundColor: const Color.fromARGB(255, 255, 132, 132),
    );
  }
}
