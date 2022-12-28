import 'package:chat_flutter/components/profile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:swipe_deck/swipe_deck.dart';

const IMAGES = [
  "buisness",
  "compSci",
  "engineer",
  "scientist",
  "surgeon",
  "woman"
];
const names = [
  "buisness Man",
  "Nerd",
  "geek",
  "science sis",
  "Doctor Doctor",
  "woman"
];
const positions = [
  "Business Man",
  "Software Developer",
  "engineer",
  "scientist",
  "Surgeon",
  "woman"
];
const companies = [
  "buissTech",
  "ComputersInc",
  "EnGring",
  "Science town",
  "Doctor Doctor",
  "woman"
];

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //sign user out

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Homepage'),
            backgroundColor: Colors.black87,
            actions: [
              IconButton(
                  onPressed: signUserOut,
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Colors.amber[400],
                  ))
            ]),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Welcome!\n Logged in as: ${user.email!}',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
                child: Stack(
              children: [
                //profile card stack
                SwipeDeck(
                    startIndex: 4,
                    emptyIndicator: Container(
                      child: Center(
                        child: Text("Nothing left here !"),
                      ),
                    ),
                    cardSpreadInDegrees: 5,
                    onSwipeLeft: () {
                      print("USER SWIPED LEFT -> GOING TO NEXT WIDGET");
                    },
                    onSwipeRight: () {
                      print("USER SWIPED RIGHT -> GOING TO PREVIOUS WIDGET");
                    },
                    onChange: (index) {
                      print(IMAGES[index]);
                    },
                    widgets: IMAGES
                        .map((e) => ProfileCard(
                              company: e,
                              imgIndex: e,
                              position: e,
                              userName: e,
                            ))
                        .toList())
              ],
            )),
          ]),
        ));
  }

  List<List<Color>> gradientColors = [
    [Colors.indigo, Colors.indigoAccent, Colors.grey[900]!],
    [Colors.amber, Colors.amberAccent, Colors.grey[900]!],
    [Colors.blue, Colors.blueAccent, Colors.white],
    [Colors.white70, Colors.grey, Colors.grey[900]!],
    [Colors.orange, Colors.orangeAccent, Colors.white],
    [Colors.red, Colors.redAccent, Colors.grey[900]!],
  ];

  Widget profileCards(
          String index, String name, String position, String company) =>
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
          children: [
            Image.asset(
              "lib/images/profiles/$index.jpg",
              fit: BoxFit.cover,
            ),
            Text(name),
            Text(position),
            Text(company),
          ],
        ),
      );
}
