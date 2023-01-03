import 'package:flutter/material.dart';

import 'package:appinio_swiper/appinio_swiper.dart';

class SwipingButton extends StatelessWidget {
  const SwipingButton({super.key, required this.onTap, required this.child});
  final Function onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: child,
    );
  }
}

//Accept

Widget swipeRightButton(AppinioSwiperController controller) {
  return SwipingButton(
    onTap: () => controller.swipeRight(),
    child: Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.amber,
          boxShadow: [
            BoxShadow(
                color: Colors.orange.withAlpha(50),
                spreadRadius: 7,
                blurRadius: 10)
          ]),
      child: const Icon(
        Icons.lightbulb,
        color: Colors.white,
        size: 50,
      ),
    ),
  );
}

//Reject

Widget swipeLeftButton(AppinioSwiperController controller) {
  return SwipingButton(
    onTap: () => controller.swipeLeft(),
    child: Container(
      width: 80,
      height: 80,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.red, boxShadow: [
        BoxShadow(
            color: Colors.redAccent.withAlpha(25),
            spreadRadius: 5,
            blurRadius: 10)
      ]),
      child: const Icon(
        Icons.close_rounded,
        color: Colors.white,
        size: 50,
      ),
    ),
  );
}

//unswipe

Widget unswipeButton(AppinioSwiperController controller) {
  return SwipingButton(
      onTap: () => controller.unswipe(),
      child: Container(
        height: 60,
        width: 60,
        alignment: Alignment.center,
        child: const Icon(
          Icons.rotate_left_rounded,
          color: Colors.grey,
          size: 40,
        ),
      ));
}
