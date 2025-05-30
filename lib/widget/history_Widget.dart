import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  final String pathImage;
  final String textHistory;
  final VoidCallback goSound;

  HistoryWidget(
      {super.key,
      required this.pathImage,
      required this.textHistory,
      required this.goSound});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: goSound,
          child: Container(
            margin: const EdgeInsets.only(right: 10, top: 10),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(pathImage), fit: BoxFit.cover),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          textHistory,
          style: const TextStyle(fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
