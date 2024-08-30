import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/loginpage.dart';
import 'package:learn_firebase/signinpage.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return checkuser();
  }
  Widget checkuser()  {
    final user =  FirebaseAuth.instance.currentUser;
    if (user != null) {
      return SignInPage();
    } else {
      return LoginPage();
    }
  }
}
