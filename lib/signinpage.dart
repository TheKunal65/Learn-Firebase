import 'package:flutter/material.dart';
import 'package:learn_firebase/forgotpassword.dart';
import 'package:learn_firebase/loginpage.dart';
import 'package:learn_firebase/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signin(String email, String password) async {
    if (email == "" && password == "") {
      return UiHelper.AlertBox(context, "Enter required fields");
    } else {
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelper.AlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Sign In"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(emailController, "Email", Icons.mail, false),
          UiHelper.CustomTextField(
              passwordController, "Password", Icons.password, true),
          SizedBox(height: 30),
          UiHelper.CustomButton(() {
            signin(emailController.text.toString(),
                passwordController.text.toString());
          }, "Sign In"),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForgotPassword()));
              },
              child: Text("Forgot Password??")),
        ],
      ),
    );
  }
}
