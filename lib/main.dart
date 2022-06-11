import 'package:flutter/material.dart';
import 'package:montyhacks2022/screens/Homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login/loginScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool islogin = false;
  bool islogin1 = false;
  final prefs = await SharedPreferences.getInstance();
  islogin = prefs.getBool('deleteAll') ?? false;
  islogin1 = prefs.getBool('EKdeleteAll') ?? false;

  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: islogin
        ? const MyApp()
        : islogin1
            ? const MyApp()
            : login(),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackiton',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Recycle IT!'),
    );
  }
}
