import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:chat_flutter/components/example_candidate_model.dart';
import 'package:chat_flutter/components/profile_card.dart';
import 'package:chat_flutter/components/swiping_buttons.dart';
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

  void _loadCards() {
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
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.50,
                child: AppinioSwiper(
                  unlimitedUnswipe: true,
                  controller: controller,
                  unswipe: _unswipe,
                  cards: cards,
                  onSwipe: _swipe,
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                    top: 25,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                      ),
                      swipeLeftButton(controller),
                      SizedBox(
                        width: 50,
                      ),
                      swipeRightButton(controller),
                      SizedBox(
                        width: 20,
                      ),
                      unswipeButton(controller),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
