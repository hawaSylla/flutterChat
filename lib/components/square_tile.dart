import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final Function()? onTap;
  final String imagePath;
  final double imgHeight;
  const SquareTile(
      {super.key,
      required this.imagePath,
      required this.imgHeight,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[200]),
        child: Image.asset(
          imagePath,
          height: imgHeight,
        ),
      ),
    );
  }
}
