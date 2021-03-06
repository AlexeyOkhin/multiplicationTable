import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:async/async.dart';

class TestPage extends StatefulWidget {
  TestPage({this.numButton});

  final int numButton;

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Duration _timerDuration = Duration(seconds: 10);
  RestartableTimer _timer;
  var numWrongAnswer = 0;
  String textAlertTitle;
  String textAlertDisription;
  var labelText = "";
  var _arrayExemples = <String>[];
  var _dictionaryExamples = Map<String, int>();

  List<Icon> _arrayAnswerCheck = [];
  final controllerOne = TextEditingController();
  Random randomize = Random();

  void onSubmited(String text) {

    setState(() {
      print(text);
      _timer.reset();
      controllerOne.clear();
      Icon iconTrue = Icon(
        Icons.school,
        color: Colors.blue,
      );
      Icon iconFalse = Icon(
        Icons.block,
        color: Colors.red,
      );
      String trueAnswer = _dictionaryExamples[labelText].toString();

      if (text == trueAnswer) {
        _arrayAnswerCheck.add(iconTrue);
      } else {
        _arrayAnswerCheck.add(iconFalse);
        numWrongAnswer++;
        print(_dictionaryExamples[labelText]);
        print("text = $text");
      }

      if (_arrayAnswerCheck.length == 10) {
        _timer.cancel();

        switch (numWrongAnswer) {
          case 0:
            textAlertTitle = "Ты молодец 🥱😃";
            textAlertDisription = "Поздравляю!!!";
            break;
          case 1:
            textAlertTitle = "Хорошо 🧑";
            textAlertDisription = "Можно повторить";
            break;
          case 2:
            textAlertTitle = "Хорошо 🧑";
            textAlertDisription = "Советую повторить!";
            break;

          default:
            textAlertTitle = "Плохо ☹";
            textAlertDisription = "Обязательно повтори урок!!";
        }

        Alert(
          context: context,
          type: AlertType.info,
          title: textAlertTitle,
          desc: textAlertDisription,
          buttons: [
            DialogButton(
              child: Text(
                "В начало",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false);

              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                "Повторить",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                _timer = RestartableTimer(_timerDuration, () {onSubmited(" ");});
                setState(() {

                  numWrongAnswer = 0;
                  _arrayAnswerCheck.clear();
                  _arrayExemples = getExample(widget.numButton).keys.toList();
                  Navigator.pop(context);
                });
              },
              gradient: LinearGradient(colors: [
                Color.fromRGBO(137, 137, 222, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0),
              ]),
            )
          ],
        ).show();
      }
    });
  }

  Map<String, int> getExample(int numButton) {
    Map<String, int> _dictionary = <String, int>{};
    if (numButton < 11) {
      for (int i = 1; i < 11; i++) {
        int _multip = (i * numButton);
        String _resultString = "$numButton * $i =";

        _dictionary[_resultString] = _multip;
      }
      return _dictionary;
    }
  }

  String _getLabelText() {
    return _arrayExemples.length > 0
        ? _arrayExemples.removeAt(randomize.nextInt(_arrayExemples.length))
        : " ";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = RestartableTimer(_timerDuration, () {onSubmited(" ");});
    print("Init timerDuration = $_timerDuration, timer = $_timer");
    print("initState");
    labelText = _getLabelText();


      _arrayExemples = getExample(widget.numButton).keys.toList();
      _dictionaryExamples = getExample(widget.numButton);

      print(_arrayExemples);

  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("timerDuration = $_timerDuration, timer = $_timer");

    labelText = _getLabelText();

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/chalkDesck.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
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
        body: Container(
          child: Column(
            children: [
              ProgressBarTick(start: 1,),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _arrayAnswerCheck,
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    labelText,
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.white70,
                        fontFamily: "LCChalk"),
                  ),
                  Container(
                    width: 120,
                    child: TextField(
                      //focusNode: focusNodeOne,
                      autofocus: true,

                      //maxLength: 2,
                      controller: controllerOne,
                      onSubmitted: onSubmited,
                      onEditingComplete: () {},
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                          fontFamily: "LCChalk",
                          color: Colors.white70,
                          fontSize: 45),

                      keyboardType: TextInputType.number,
                      showCursor: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            style: BorderStyle.none,
                          )),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            style: BorderStyle.none,
                          ))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class ProgressBarTick extends StatefulWidget {
  ProgressBarTick({this.start});
  double start = 1;
  @override
  _ProgressBarTickState createState() => _ProgressBarTickState();
}

class _ProgressBarTickState extends State<ProgressBarTick> {

  Timer _timer;


  void startTimer() {
    const oneSec = const Duration(milliseconds: 100);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer){
        print("start = " + widget.start.toStringAsFixed(2));
        if (widget.start.toStringAsFixed(2) == "-0.00") {
          setState(() {
            widget.start = 1;



            //timer.cancel();
          });
        } else {
          setState(() {

            widget.start -= 0.01;
          });
        }
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return LinearProgressIndicator(
      value: widget.start,
    );
  }
}
