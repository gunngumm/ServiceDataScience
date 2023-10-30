import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'dart:math';
import 'dart:async' show Future;
import 'package:flutter/widgets.dart';



class angrysong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: _angrysong(), // finals 데이터는 필요에 맞게 전달해야 합니다.
    );
  }
}


class _angrysong extends StatefulWidget {
  @override
  _angrysongState createState() => _angrysongState();
}

class _angrysongState extends State<_angrysong> {
  List<dynamic> randomValue = List<dynamic>.filled(2, '');

  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  Future<void> loadAsset() async {
    final myData = await rootBundle.loadString('assets/result_negative.csv');
    List<List<dynamic>> csvTable = const CsvToListConverter().convert(myData);
    //List<List<dynamic>> topTen = csvTable.sublist(0, 5);
    List<dynamic> finalTable = [];
    for (int i = 4; i < csvTable[0].length; i++) {
      if (i % 3 == 0) {
        continue;
      }
      finalTable.add(csvTable[0][i]);
    }

    List<dynamic> finalTable_sublist = finalTable.sublist(0, 100);


    // 랜덤으로 선택
    List<dynamic> selectedValue = [];
    final random = Random();
    final randomIndex = random.nextInt(finalTable_sublist.length ~/ 2);
    selectedValue.add(finalTable_sublist[randomIndex * 2]);
    selectedValue.add(finalTable_sublist[randomIndex * 2 + 1]);

    setState(() {
      randomValue = selectedValue;
    });
    print(randomValue);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(
              Icons.refresh
          ),
          backgroundColor: Colors.deepPurple,
          onPressed: () async {
            await loadAsset();
          }),

      appBar: AppBar(
        title: Text("음악 추천"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.music_note,
                  size: 100.0,
                  color: Colors.deepPurple,
                ),
                const SizedBox(height: 30,),
                Text(' 지금 당신의 기분에 맞는 노래는',
                  style: TextStyle(
                    fontFamily: '이끌림', // 원하는 글꼴 설정
                    color: Colors.deepPurple, // 원하는 색상 설정
                    fontWeight: FontWeight.bold, // 볼드(Bold) 스타일 적용
                    fontSize: 15.0,

                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  randomValue[0],
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(height: 8.0), // 각 줄 사이에 간격 추가
                Text(
                  randomValue[1],
                  style: TextStyle(fontSize: 20.0),
                )
              ]
          )
      ),
    );
  }
}