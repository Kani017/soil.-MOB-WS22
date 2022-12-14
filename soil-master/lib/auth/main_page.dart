import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mainprojectapp_ntt/auth/auth_page.dart';
import 'package:mainprojectapp_ntt/pages/login_page.dart';
import '../pages/structure.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.hasData) {
            return Structure();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}
