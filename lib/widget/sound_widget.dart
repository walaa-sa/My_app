import 'package:flutter/material.dart';

class SoundWidget extends StatelessWidget {
  final String pathImage;
  final String textTitle;
  final String textSubTitle;

  SoundWidget(
      {super.key,
      required this.pathImage,
      required this.textTitle,
      required this.textSubTitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        leading: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(pathImage), fit: BoxFit.cover)),
        ),
        title: Text(textTitle),
        subtitle: Text(textSubTitle),
        trailing:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
