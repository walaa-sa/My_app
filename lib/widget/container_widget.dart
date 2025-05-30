import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final String textContainer;
  ContainerWidget({super.key, required this.textContainer});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xffFF5F39),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        textContainer,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
