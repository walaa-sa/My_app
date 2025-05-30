import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final VoidCallback myOnTap;
  final String nameCategory;
  final bool isSelected;
  const CategoryWidget(
      {super.key,
      required this.myOnTap,
      required this.nameCategory,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: myOnTap,
        child: Text(
          nameCategory,
          style: TextStyle(
            color: isSelected == false
                ? const Color(0xffCF8420)
                : const Color(0xff703900),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ));
  }
}
