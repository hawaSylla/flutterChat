import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileCard extends StatelessWidget {
  final String imgIndex;
  final String userName;
  final String position;
  final String company;
  final color;
  const ProfileCard(
      {super.key,
      this.color,
      required this.imgIndex,
      required this.userName,
      required this.position,
      required this.company});

  @override
  Widget build(BuildContext context) {
    var user;
    return SizedBox(
      width: MediaQuery.of(context).size.height / 1.4,
      height: MediaQuery.of(context).size.width,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(user.imageUrls[0]),
          )),
        )
      ]),
    );
  }
}
