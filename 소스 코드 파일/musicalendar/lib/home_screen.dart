import 'package:flutter/material.dart';
import 'package:musicalendar/my_page.dart';
import 'package:musicalendar/moodclick.dart';
import 'package:musicalendar/screen/calendar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
     body: SafeArea(
       top: true,
       bottom: false,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,

         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           _DDay(
            //눌렀을 떄 실행할 함수 전달
             onMyPagePressed: onMyPagePressed,
             onMusicPressed: onMusicPressed,
             onDiaryPressed: onDiaryPressed,

           ),
           _CoupleImage(),
         ],
       ),
     ),
    );
  }
  //내정보 눌렀을 떄 실행할 함수
  void onMyPagePressed(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyPage()),
    );
  }
  //음악 추천받기 눌렀을 때 실행할 함수
  void onMusicPressed(){
    print("음악 추천받기 클릭");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => moodclick()),
    );
  }
  //감정 기록일기 눌렀을 때 실행할 함수
  void onDiaryPressed(){
    print("감정 기록 일기 클릭");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Calendar()),
    );
  }
}

class _DDay extends StatelessWidget {

  final GestureTapCallback onMyPagePressed;
  final GestureTapCallback onMusicPressed;
  final GestureTapCallback onDiaryPressed;

  _DDay({
    required this.onMyPagePressed,
    required this.onMusicPressed,
    required this.onDiaryPressed,
});

  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        const SizedBox(height: 60.0,),
        Text(
            'Music Calendar',
          style: textTheme.headline1,

        ),
        const SizedBox(height: 60.0,),
        Text(
          '내 정보',
          style: textTheme.bodyText2,
        ),
        IconButton(
          iconSize: 60.0,
          onPressed: onMyPagePressed,
          icon: Icon(
            Icons.people,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 20.0,),
        Text(
          '음악 추천받기',
          style: textTheme.bodyText2,
        ),
        IconButton(
            iconSize: 80.0,
            onPressed: onMusicPressed,
            icon: Icon(
              Icons.headphones,
              color: Colors.white70,
            ),
        ),
        const SizedBox(height: 20.0,),
        Text(
          '감정 기록 일기',
          style: textTheme.bodyText2,
        ),

        IconButton(
          iconSize: 80.0,
          onPressed: onDiaryPressed,
          icon: Icon(
            Icons.date_range_rounded,
            color: Colors.white70,
          ),
        ),

      ],
    );
  }
}

class _CoupleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
      child: Image.asset(
        'assets/image/middle_image5.png',
        height: MediaQuery.of(context).size.height / 2,
      ),
    ),
    );
  }
}

