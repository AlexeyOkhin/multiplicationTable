import 'package:flutter/material.dart';
import 'package:multiplication_table/test_page.dart';
import 'info_multipler.dart';
import 'const_setting.dart';

void main() {
  runApp(StartPage());
}

class StartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => MyStartApp(),
        "/info": (context) => InfoMultipler(),
        "/test" : (context) => TestPage(),
      },
    );
  }
}

class MyStartApp extends StatelessWidget {
  const MyStartApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/chalkDesck.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/info");
              },
              child: Icon(
                Icons.error_outline,
                size: 35,
                color: Colors.blue,
              ),
            ),
          ],
          title: Text(
            "Умножалка",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white70,
                fontFamily: "LCChalk",
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        const numButton = 2;
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TestPage(numButton: numButton,)),
                      );},
                      child: StyleTextConst(text: "x2",size: 50),
                    ),
                    TextButton(
                      onPressed: () {
                        const numButton = 3;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage(numButton: numButton,)),
                        );},
                      child: StyleTextConst(text: "x3",size: 50),
                    ),
                    TextButton(
                      onPressed: () {
                        const numButton = 4;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage(numButton: numButton,)),
                        );},
                      child: StyleTextConst(text: "x4",size: 50),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        const numButton = 5;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage(numButton: numButton,)),
                        );},
                      child: StyleTextConst(text: "x5",size: 50),
                    ),
                    TextButton(
                      onPressed: () {
                        const numButton = 6;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage(numButton: numButton,)),
                        );},
                      child: StyleTextConst(text: "x6",size: 50),
                    ),
                    TextButton(
                      onPressed: () {
                        const numButton = 7;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage(numButton: numButton,)),
                        );},
                      child: StyleTextConst(text: "x7",size: 50),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        const numButton = 8;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage(numButton: numButton,)),
                        );},
                      child: StyleTextConst(text: "x8",size: 50),
                    ),
                    TextButton(
                      onPressed: () {
                        const numButton = 9;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage(numButton: numButton,)),
                        );},
                      child: StyleTextConst(text: "x9",size: 50),
                    ),
                    TextButton(
                      onPressed: () {
                        const numButton = 10;
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage(numButton: numButton,)),
                        );},
                      child: StyleTextConst(text: "x?",size: 50),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
