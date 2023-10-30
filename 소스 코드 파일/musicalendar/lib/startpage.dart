import 'package:flutter/material.dart';
import 'package:musicalendar/signup.dart';
import 'package:musicalendar/login.dart';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children: [
            Container(color:Colors.white),
            Image.asset('assets/image/logo.jpg', height:370,width: 370),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> SignUpPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white
              ),
              child: Text('회원가입'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=> LoginPage()),
                 );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white
              ),
              child: Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}