import 'package:flutter/material.dart';
import 'package:my_app_1/sound_api.dart';
import 'package:my_app_1/sound_screen.dart';
import 'package:my_app_1/widget/container_widget.dart';
import 'package:my_app_1/widget/history_Widget.dart';
import 'package:my_app_1/widget/sound_widget.dart';

class HomeScreen extends StatelessWidget {
  final SoundApi myApi = SoundApi();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Numbers of sounds
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ContainerWidget(textContainer: "122 Songs"),
                  ContainerWidget(textContainer: "46 Albums"),
                  ContainerWidget(textContainer: "23 Artists"),
                ],
              ),
            ),

            const Text(
              "History",
              style: TextStyle(
                color: Color(0xff703900),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            // History Components
            SizedBox(
              height: 130,
              child: ListView.builder(
                itemCount: myApi.mySoundApi.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return HistoryWidget(
                    pathImage: "${myApi.mySoundApi[index]["PathImage"]}",
                    textHistory: "${myApi.mySoundApi[index]["textSound"]}",
                    goSound: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SoundScreen(
                              currentPathImage:
                                  "${myApi.mySoundApi[index]["PathImage"]}",
                              currentNameSound:
                                  "${myApi.mySoundApi[index]["textSound"]}",
                              currentPathSound:
                                  "${myApi.mySoundApi[index]["pathSound"]}",
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const Text(
              "Sounds",
              style: TextStyle(
                color: Color(0xff703900),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),

            // sound components
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: myApi.mySoundApi.length,
              itemBuilder: (context, index) {
                return SoundWidget(
                  pathImage: "${myApi.mySoundApi[index]["PathImage"]}",
                  textTitle: "${myApi.mySoundApi[index]["textSound"]}",
                  textSubTitle: "Welcome in our World",
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
