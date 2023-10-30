import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('My Page'),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30.0,),
          Padding(
            padding: EdgeInsets.all(16.0),
            child:Center (
            child: CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage('assets/image/profile_image.jpg'),
            ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '하지민',
              style: TextStyle(fontSize: 30.0,color: Colors.black, fontWeight: FontWeight.bold),
            ),
            ),



          Divider(),

          const SizedBox(height: 40.0,),

          ListTile(
            leading: Icon(Icons.music_note),
            title: Text(
              '선호 장르',
              style: TextStyle(fontSize: 20.0), // 원하는 크기로 변경합니다.
            ),
            subtitle: Text(
              'k-pop, 뉴진스, 방탄소년단',
              style: TextStyle(fontSize: 18.0), // 원하는 크기로 변경합니다.
            ),
          ),
          const SizedBox(height: 20.0,),
          ListTile(
            leading: Icon(Icons.emoji_emotions),
            title: Text(
              '오늘의 기분',
              style: TextStyle(fontSize: 20.0), // 원하는 크기로 변경합니다.
            ),
            subtitle: Text(
              '행복',
              style: TextStyle(fontSize: 18.0), // 원하는 크기로 변경합니다.
            ),
          ),
          const SizedBox(height: 20.0,),
          ListTile(
            leading: Icon(Icons.people),
            title: Text(
              '친구',
              style: TextStyle(fontSize: 20.0), // 원하는 크기로 변경합니다.
            ),
            subtitle: Text(
              '183',
              style: TextStyle(fontSize: 18.0), // 원하는 크기로 변경합니다.
            ),
          ),
        ],
    ),
    );
  }
}
