import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
            title: Text('HomePage !'),
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
            child: Text(
          'Logged in as: ${user.email!}',
          style: TextStyle(fontSize: 16),
        )));
  }
}
