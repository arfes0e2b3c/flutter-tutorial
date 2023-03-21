import 'package:flutter/material.dart';

void main() {
  //アプリの起動
  runApp(const MyApp());
}

//ウィジェット=コンポーネント
//ウィジェットの生成
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 10,
            title: const Text(
              'Tutorial',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          body: Container(),
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'ホーム',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '検索',
            ),
          ]),
        ));
  }
}
