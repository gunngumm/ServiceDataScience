import 'package:firebase_auth/firebase_auth.dart';
//import 'package:musicalendar//signup.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:musicalendar/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _emailInputText = TextEditingController();
  var _passInputText = TextEditingController();

  void dispose(){
    _emailInputText.dispose();
    _passInputText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext){
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _emailInputText,
                decoration: InputDecoration(hintText: 'Email'),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: _passInputText,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
                ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async{
                  //이메일, 비번 중 하나라도 비워져있으면 안된다
                  if(_emailInputText.text.isEmpty ||
                  _passInputText.text.isEmpty) return;

                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailInputText.text.toLowerCase().trim(),
                        password: _passInputText.text.trim(),
                    );
                    print('로그인 성공');

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } on FirebaseAuthException catch (e) {
                    print('an error occured $e');
                  }
                },
                child: Text('이메일 로그인',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}