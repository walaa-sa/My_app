import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:my_app_1/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
      duration: const Duration(milliseconds: 3000),
      // gradient: const LinearGradient(
      //   colors: [Color(0xffFFC90F), Color(0xffFFE386)],
      //   begin: Alignment.bottomCenter,
      //   end: Alignment.topCenter,
      // ),
      backgroundColor: Colors.white,
      onInit: () {
        debugPrint("On Init");
      },
      onEnd: () {
        debugPrint("On End");
      },
      childWidget: SizedBox(
        height: 200,
        width: 200,
        child: Image.asset("assets/images/Logo1-01.jpeg"),
      ),
      onAnimationEnd: () => debugPrint("On Fade In End"),
      nextScreen: const WelcomeScreen(),
    );
  }
}
