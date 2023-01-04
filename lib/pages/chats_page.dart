import 'package:chat_flutter/components/navigation.dart';
import 'package:chat_flutter/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({super.key});

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                    image: const DecorationImage(
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
                fontSize: 16,
              ),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
              nextScreenReplacement(context, HomePage());
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
        centerTitle: true,
        title: const Text(
          'Messages',
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
