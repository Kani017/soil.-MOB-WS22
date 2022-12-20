import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  State<UserHome> createState() => _HomePageState();
}

class _HomePageState extends State<UserHome> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
         child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
                'See you soon!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color(0xFF1F312B)
                ),
              ),
            SizedBox(height: 270),
            ElevatedButton(
                onPressed: (
                    ) {
                  FirebaseAuth.instance.signOut();
                },
                child: Text('Sign out'),
                style: ElevatedButton.styleFrom(shape: StadiumBorder(), primary: Color(0xFF2D6550), textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontStyle: FontStyle.normal),
                ),
              ),
            Text('signed in as: ' + user.email!,
              style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFFFFFFFF)
              ),
            )
           ],
          ),
         ),
        ),
      ),
    );
  }
}
