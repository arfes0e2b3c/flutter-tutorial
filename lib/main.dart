import 'package:flutter/material.dart';
import 'package:tutorial/constant/mock.dart';
import 'package:tutorial/repository/youtube.dart';

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
          body: FutureBuilder(
              future: YouTubeRepository().fetchVideos(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final videos = snapshot.data!;
                  return Center(
                      child: ListView.builder(
                    itemCount: videos.length,
                    itemBuilder: (context, index) => ListTile(
                      // elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      // child: Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: Text(videos[index].title),
                      // )),
                      title: Text(videos[index].title),
                      subtitle: Text('subtitle'),
                      leading: Icon(Icons.youtube_searched_for_rounded,
                          color: Colors.blue),
                    ),
                  ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                ;
              }),
          // body: ListView.separated(
          //   itemCount: names.length,
          //   separatorBuilder: (context, index) => const Divider(
          //     color: Colors.grey,
          //     indent: 20,
          //     endIndent: 20,
          //     height: 0,
          //   ),
          //   itemBuilder: (context, index) => Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 20),
          //     child: Text(
          //       names[index],
          //       textAlign: TextAlign.center,
          //       style: TextStyle(fontSize: 30),
          //     ),
          //   ),
          // ),
          // body: ListView(            children: [
          //     Container(
          //       color: Colors.red,
          //       height: 500,
          //     ),
          //     Container(
          //       color: Colors.blue,
          //       height: 500,
          //     ),
          //     Container(
          //       color: Colors.green,
          //       height: 500,
          //     ),
          //   ],
          // ),
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
