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
            padding: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(color: Colors.black87),
            child: Column(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://media.istockphoto.com/id/1362937229/photo/i-love-my-job.jpg?b=1&s=170667a&w=0&k=20&c=GYqe3l5jtsPKzR3xyed35H_M98jiV4eyqYBvH1KvrSk='),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  user.email!,
                  style: const TextStyle(fontSize: 20, color: Colors.amber),
                ),
              ],
            ),
          ),
          ListTile(
            leading:
                const Icon(Icons.emoji_people_rounded, color: Colors.black54),
            title: const Text(
              'Browse',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
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
            leading: const Icon(Icons.people, color: Colors.black54),
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
            leading: const Icon(Icons.settings, color: Colors.black54),
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
          title: const Text('Browse'),
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
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
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
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: const Border(
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
                      const SizedBox(
                        width: 60,
                      ),
                      swipeLeftButton(controller),
                      const SizedBox(
                        width: 50,
                      ),
                      swipeRightButton(controller),
                      const SizedBox(
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
