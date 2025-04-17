import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:workout_planner/wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

        splash:
            Center(
              child: Lottie.asset('assests/Animation - 1731733760268.json'),
            ),
        nextScreen: Wrapper(),
      duration: 18000,
      backgroundColor: Color.fromARGB(255, 209, 243, 248),
      splashIconSize: 225,



        );
  }
}
