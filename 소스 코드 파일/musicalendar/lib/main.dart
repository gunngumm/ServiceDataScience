import 'package:flutter/material.dart';
//import 'package:intl/date_symbol_data_http_request.dart';
import 'package:musicalendar/database/drift_database.dart';
import 'package:musicalendar/startpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:musicalendar/screen/calendar_screen.dart';



//앱의 시작점
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: '이끌림',
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
              fontFamily: '이끌림',
            ),
            headline2: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          )
        ),
      home: StartPage(), //가장 먼저 화면에 보여지는 경로
    );
  }
}
