import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app_1/home_screen_echo.dart';

class WelcomeScreenWidget extends StatelessWidget {
  final String pathImage;
  final String titleTixt;
  final String detailsTixt;
  final String pathSVG;
  final VoidCallback nextWelcomeScreen;
  WelcomeScreenWidget({
    super.key,
    required this.pathImage,
    required this.titleTixt,
    required this.detailsTixt,
    required this.pathSVG,
    required this.nextWelcomeScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomeScreenEcho();
                    },
                  ),
                );
              },
              child: const Text("Skip", style: TextStyle(color: Colors.grey)),
            ),
          ),
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 187, 70, 118),
            radius: 150,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 114, 27, 255),
              radius: 145,
              child: CircleAvatar(
                radius: 140,
                backgroundImage: AssetImage(pathImage),
              ),
            ),
          ),
          Text(
            titleTixt,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          Text(detailsTixt),
          GestureDetector(
            onTap: nextWelcomeScreen,
            child: SvgPicture.asset(
              width: 400,
              height: 98,
              fit: BoxFit.cover,
              pathSVG,
            ),
          ),
        ],
      ),
    );
  }
}
