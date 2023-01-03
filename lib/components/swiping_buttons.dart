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
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 255, 193, 7),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withAlpha(50),
              spreadRadius: 10,
              blurRadius: 20,
              offset: const Offset(0, 20),
            ) // changes position of shadow)
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
      width: 100,
      height: 100,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: Colors.red, boxShadow: [
        BoxShadow(
          color: Colors.redAccent.withAlpha(50),
          spreadRadius: 10,
          blurRadius: 20,
          offset: const Offset(0, 20),
        )
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
