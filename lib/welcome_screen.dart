import 'package:flutter/material.dart';
import 'package:my_app_1/home_screen_echo.dart';
import 'widget/welcome_screen_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int numScreen = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildWelcomeScreens(numScreen));
  }

  Widget buildWelcomeScreens(int index) {
    switch (index) {
      case 1:
        return WelcomeScreenWidget(
          pathImage: "assets/images/welcome.jpeg",
          titleTixt: "Echo Tunes – Your Personalized Music Universe",
          detailsTixt:
              "Dive into a world of sound like never before with Echo Tunes – the ultimate destination for music lovers.",
          pathSVG: "assets/images/02-01_fixed_for_flutter.svg",
          nextWelcomeScreen: () {
            setState(() {
              numScreen++;
            });
          },
        );
      case 2:
        return WelcomeScreenWidget(
          pathImage: "assets/images/2.jpg",
          titleTixt: "feel the rhythm , live the moment",
          detailsTixt:
              "Dive into a world of sound like never before with Echo Tunes – the ultimate destination for music lovers.",
          pathSVG: "assets/images/02-01_fixed_for_flutter.svg",
          nextWelcomeScreen: () {
            setState(() {
              numScreen++;
            });
          },
        );
      case 3:
        return WelcomeScreenWidget(
          pathImage: "assetsl/images/1.jpg",
          titleTixt: "your favorite sounds , all in one place",
          detailsTixt:
              "Dive into a world of sound like never before with Echo Tunes – the ultimate destination for music lovers.",
          pathSVG: "assets/images/02-01_fixed_for_flutter.svg",
          nextWelcomeScreen: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomeScreenEcho();
                },
              ),
            );
          },
        );
      default:
        return Container(
            width: double.infinity,
            height: 90,
            color: const Color.fromARGB(255, 172, 103, 230));
    }
  }
}
