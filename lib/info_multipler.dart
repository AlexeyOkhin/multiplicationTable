import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'date_multipler.dart';


class InfoMultipler extends StatelessWidget {
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
          child: ButtonsHelper(),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class ButtonsHelper extends StatefulWidget {
  const ButtonsHelper({Key key}) : super(key: key);

  @override
  _ButtonsHelperState createState() => _ButtonsHelperState();
}

class _ButtonsHelperState extends State<ButtonsHelper> {
  var date = DateMultipler();
  int numTable;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numTable = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: date.getTable(numTable).length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(
                    '${date.getTable(numTable)[index]}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                        fontFamily: "LCChalk",
                        fontWeight: FontWeight.bold),
                  ));
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 1;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "1x",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 2;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "2x",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 3;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "3x",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 4;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "4x",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 5;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "5x",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 6;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "6x",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 7;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "7x",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 8;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "8x",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 9;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "9x",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    numTable = 10;
                  });
                },
                shape: CircleBorder(
                    side: BorderSide(width: 3, color: Colors.white70)),
                backgroundColor: Colors.transparent,
                child: Text(
                  "10x",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontFamily: "LCChalk"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
