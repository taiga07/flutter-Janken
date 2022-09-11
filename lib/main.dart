import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//アプリ作成時に最初に作る
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JankenPage(),
    );
  }
}
//ここまで

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
//変数を使えるのはstatefulwidget。

  String myHand = '✊';
  String computerHand = '✊';
  String result = '引き分け';

  //関数
  void selectHand(String selectedHand) {
    //似たような処理を関数でまとめ、使いたいところで呼び出す。
    myHand = selectedHand;
    // print(selectedHand);
    generateComputerHand();
    judge();
    setState(() {}); //←画面を更新する命令
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  String randomNumberToHand(int randomNumber) {
    switch (randomNumber) {
      case 0:
        return '✊';
        break;
      case 1:
        return '✌️';
        break;
      case 2:
        return '✋';
        break;
      default:
        return '✊';
        break;
    }
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '✋' ||
        myHand == '✋' && computerHand == '✊') {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

//変数を定義するときは↓の@overrideよりも上で定義する。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              computerHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              myHand,
              style: TextStyle(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Row(
              //↓左右均等にする
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  //↓コンソールに表示したいときonPressedに記述する
                  onPressed: () {
                    selectHand('✊');
                    // myHand = '✊';
                    // print('✊');
                    // setState(() {}); //←画面を更新する命令
                  },
                  child: Text('✊'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✌️');
                    // myHand = '✌️';
                    // print('✌️');
                    // setState(() {}); //←画面を更新する命令
                  },
                  child: Text('✌️'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectHand('✋');
                    // myHand = '✋';
                    // print('✋');
                    // setState(() {}); //←画面を更新する命令
                  },
                  child: Text('✋'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
