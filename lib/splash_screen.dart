import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indonesia_bijak/bloc/user_bloc.dart';
import 'package:indonesia_bijak/models/user_model.dart';
import 'package:lottie/lottie.dart';
import 'package:indonesia_bijak/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();
      if (!mounted) {
        return;
      }
      context.read<UserBloc>().saveUser(
            UserModel(
              nik: userDoc['nik'],
              name: userDoc['name'],
              address: userDoc['address']
            ),
          );
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message!),
        ),
      );
    }
  }

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
          const Text(
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
      function: () async {
        await _fetchUserData();
      },
      backgroundColor: const Color.fromARGB(255, 255, 132, 132),
    );
  }
}
