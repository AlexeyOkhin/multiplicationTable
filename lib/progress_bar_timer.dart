import 'package:flutter/material.dart';
import 'dart:async';
import 'package:countdown_flutter/countdown_flutter.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              TextButton(
                  onPressed: () {},
                  child: CountdownFormatted(
                    duration: Duration(hours: 00, minutes: 2, seconds: 00),
                    builder: (BuildContext ctx, String remaining) {
                      return Text(
                        remaining,
                        style: TextStyle(fontSize: 20),
                      ); // 01:00:00
                    },
                  )
              ),
            ],
          ),
          body: Center(
            child: ChangeNotifierProvider<TimeState>(
              create: (context) => TimeState(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer<TimeState>(
                    builder: (context, timeState,_) => CustomProgressBar(
                      width: 420,
                      value: timeState.time,
                      totalValue: 100,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Consumer<TimeState>(
                    builder: (context, timeState, _) => RaisedButton(
                      color: Colors.lightBlue,
                      child: Text("Start", style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        Timer.periodic(Duration(seconds: 1), (timer) {
                          if(timeState.time == 0)
                            timer.cancel();
                          else
                            timeState.time -= 1;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
class CustomProgressBar extends StatelessWidget {
  final double width;
  final int value;
  final int totalValue;

  CustomProgressBar({this.width, this.value, this.totalValue});

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    double ratio = value / totalValue;
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: 10,
                decoration: BoxDecoration(color: Colors.grey[300]),
              ),
              Material(
                borderRadius: BorderRadius.circular(5),
                child: AnimatedContainer(
                    height: 10,
                    width: width * ratio,
                    duration: Duration(milliseconds: totalValue),
                    decoration: BoxDecoration(
                        color: (ratio < 0.3) ?
                        Colors.red : (ratio < 0.6) ?
                        Colors.orange : (ratio < 0.9) ?
                        Colors.amber : Colors.green,
                        borderRadius: BorderRadius.circular(5)
                    )
                ),
              ),
            ],
          )
        ]
    );
  }
}
class TimeState with ChangeNotifier{
  int _time = 10;
  int get time => _time;
  set time(int newTime){
    _time = newTime;
    notifyListeners();
  }
}