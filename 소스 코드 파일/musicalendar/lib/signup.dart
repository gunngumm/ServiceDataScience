import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:musicalendar/startpage.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _emailInputText = TextEditingController();
  var _passInputText = TextEditingController();

  void dispose(){
    _emailInputText.dispose();
    _passInputText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
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
                  onPressed: () async {
                    // 이메일, 비번 중 하나라도 비워있으면 패스
                    if (_emailInputText.text.isEmpty ||
                        _passInputText.text.isEmpty) return;
                    try {
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailInputText.text.toLowerCase().trim(),//가입 이메일
                          password: _passInputText.text.trim(),//비밀번호
                      );
                      print('가입 성공');
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StartPage()),
                      );
                    } on FirebaseAuthException catch (e) {
                      print('an error occured $e');
                    }
                  },
                  child: Text(
                      '이메일 회원가입',
                      style: TextStyle(color:Colors.purpleAccent),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
      
      
      
