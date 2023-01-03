import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:chat_flutter/components/example_candidate_model.dart';
import 'package:chat_flutter/components/profile_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  final AppinioSwiperController controller = AppinioSwiperController();

  List<ProfileCard> cards = [];

  @override
  void initState() {
    _loadCards();
    super.initState();
  }

  void _loadCards() async {
    for (ExampleCandidateModel candidate in candidates) {
      cards.add(
        ProfileCard(
          candidate: candidate,
        ),
      );
    }
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    log("the card was swiped to the: ${direction.name}");
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      log("SUCCESS: card was unswiped");
    } else {
      log("FAIL: no card left to unswipe");
    }
  }

  //sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.black87),
            child: Text(
              user.email!,
              style: TextStyle(fontSize: 20, color: Colors.amber[400]),
            ),
          ),
          ListTile(
            leading: Icon(Icons.emoji_people_rounded, color: Colors.black54),
            title: const Text(
              'Browse',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...

              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.messenger_rounded,
              color: Colors.black54,
            ),
            title: const Text(
              'Messages',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...

              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.people, color: Colors.black54),
            title: const Text(
              'My Mentors',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...

              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black54),
            title: const Text(
              'Settings',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...

              Navigator.pop(context);
            },
          ),
        ],
      )),
      appBar: AppBar(
          title: Text('Browse'),
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Probably make this into a welcome widget later
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    const Text(
                      'Welcome !',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Logged in as: ${user.email!}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                child: AppinioSwiper(
                  unlimitedUnswipe: true,
                  allowUnswipe: true,
                  controller: controller,
                  unswipe: _unswipe,
                  cards: cards,
                  onSwipe: _swipe,
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 50,
                    bottom: 40,
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(
                      color: Colors.black54,
                      width: .25,
                    ))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withAlpha(20),
                                  spreadRadius: 5,
                                  blurRadius: 10)
                            ]),
                        child: Icon(
                          Icons.not_interested,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      // SizedBox(
                      //   width: 15,
                      // ),
                      Container(
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
                        child: Icon(
                          Icons.lightbulb,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
