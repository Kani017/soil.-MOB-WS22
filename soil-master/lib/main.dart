import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mainprojectapp_ntt/services/notification_services.dart';
import 'pages/login_page.dart';
import 'auth/main_page.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
