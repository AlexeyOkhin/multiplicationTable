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
Duration _timerDuration = Duration(seconds: 5);
  var numWrongAnswer = 0;
  var labelText = "";
  var _arrayExemples = <String>[];
  var _dictionaryExamples = Map<String, int>();
  FocusNode focusNodeOne;
  List<Icon> _arrayAnswerCheck = [];
  final controllerOne = TextEditingController();
  Random randomize = Random();

  void _onSubmited(String text) {
    setState(() {

      print(text);
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
        // switch numWrongAnswer {
        //
        // }

        Alert(
          context: context,
          type: AlertType.info,
          title: "ОПРОС ОКОНЧЕН $numWrongAnswer ошибок",
          desc: "ВЫ ответили на все вопросы",
          buttons: [
            DialogButton(
              child: Text(
                "В начало",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                //backPage = true;
                Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                setState(() {});
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                "Повторить",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                setState(() {
                  numWrongAnswer = 0;
                  _arrayAnswerCheck.clear();
                  _arrayExemples = getExample(widget.numButton).keys.toList();
                  Navigator.pop(context);
                });
              },
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
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


    print("initState");
    labelText = _getLabelText();
    focusNodeOne = FocusNode();
    setState(() {
      _arrayExemples = getExample(widget.numButton).keys.toList();
      _dictionaryExamples = getExample(widget.numButton);

      print(_arrayExemples);
      focusNodeOne.requestFocus();
    });
  }

  @override
  void dispose() {
    focusNodeOne.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RestartableTimer _timer = new RestartableTimer(_timerDuration, () {
      setState(() {
        _onSubmited(" ");
      });
    });
    focusNodeOne.requestFocus();
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
                        fontSize: 50,
                        color: Colors.white70,
                        fontFamily: "LCChalk"),
                  ),
                  Container(
                    width: 140,
                    child: TextField(
                      focusNode: focusNodeOne,
                      autofocus: true,

                      //maxLength: 2,
                      controller: controllerOne,
                      onSubmitted: _onSubmited,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                          fontFamily: "LCChalk",
                          color: Colors.white70,
                          fontSize: 50),

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
