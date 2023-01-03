import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ExampleCard extends StatefulWidget {
  final String img;
  final String userName;
  final String position;
  final String company;
  final color;
  const ExampleCard(
      {super.key,
      this.color,
      required this.img,
      required this.userName,
      required this.position,
      required this.company});

  @override
  State<ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends State<ExampleCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height / 2,
      height: MediaQuery.of(context).size.width / 2,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.indigo, Colors.white70],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "lib/images/profiles/${widget.img}.jpg",
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.userName),
                  Text(widget.position),
                  Text(widget.company),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
