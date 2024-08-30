import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learn_firebase/checkuser.dart';
import 'package:learn_firebase/firebase_options.dart';
import 'package:learn_firebase/loginpage.dart';
import 'package:learn_firebase/phoneauth.dart';
import 'package:learn_firebase/showdata.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn Firebase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 106, 50, 202)),
        useMaterial3: true,
      ),
      home: ShowData(),
    );
  }
}
