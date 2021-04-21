import 'package:flutter/material.dart';
import 'courseinfo/CourseInfo.dart';
import 'home/Home.dart';
import 'login/login_page.dart';
import 'member/Member.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        bottomAppBarColor: Colors.brown,
        buttonTheme:ButtonThemeData(minWidth: double.infinity,height:50)),

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  //navbar點擊的頁面
  int pageIndex = 0;
  final pages = [
    Home(),
    CourseInfo(),
    Member(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(icon:Icon(Icons.home),label:'首頁'),
          BottomNavigationBarItem(icon:Icon(Icons.list),label:'課程'),
          BottomNavigationBarItem(icon:Icon(Icons.account_circle),label:'會員中心'),
          BottomNavigationBarItem(icon:Icon(Icons.account_circle_rounded),label:'登入'),
        ],
       backgroundColor: Colors.grey[800],
       unselectedItemColor: Colors.white,
       fixedColor: Colors.amber,
       currentIndex: pageIndex,
        onTap:(index){
          setState(() {
            pageIndex = index;
          });
         },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.adb),
        onPressed: (){
          // setState()：當需要畫面更新時，就會呼叫此函數，並觸發 build()進重建 Scaffold
          setState(() {
            count += 1;
          });
        },
      ),
    );
  }
}
