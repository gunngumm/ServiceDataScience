import 'package:flutter/material.dart';
import 'package:musicalendar/angrysong.dart';
import 'package:musicalendar/boringsong.dart';
import 'package:musicalendar/happysong.dart';
import 'package:musicalendar/sadsong.dart';

class moodclick extends StatefulWidget {
  @override
  _moodclickState createState() => _moodclickState();
}

class _moodclickState extends State<moodclick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          children:[
            Container(color: Colors.white,
                      padding: EdgeInsets.all(60)),

            Text('오늘 당신의 감정은 \n    어떠셨나요?',
            style: TextStyle(fontFamily: '이끌림',fontSize: 30, color: Colors.black54),),

            InkWell(
              child: Image.asset('assets/image/happy.jpg',height:100,width: 100),
              onTap: (){
                Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context)=> happysong()),);
              },
            ),

            InkWell(
              child: Image.asset('assets/image/boring.jpg',height:100,width: 100),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> boringsong()),);
              },
            ),

            InkWell(
              child: Image.asset('assets/image/sad.jpg',height:100,width: 100),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> sadsong()),);
              },
            ),

            InkWell(
              child: Image.asset('assets/image/angry.jpg',height:100,width: 100),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> angrysong(),));
              },
            ),


          ],
        ),
      ),


    );

  }
}
