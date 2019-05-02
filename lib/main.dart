import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ButtonDemo(),
  ));
}

String dropdownValue = 'One';

class ButtonDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ButtonDemoState();
  }
}

class ButtonDemoState extends State<ButtonDemo> {
  int number = 0;

  void subtractNumbers() {
    setState(() {
      number = number - 1;
    });
  }

  void addNumbers() {
    setState(() {
      number = number + 1;
    });
  }

  void resetNumber() {
    setState(() {
      number = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter Buttons"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                '$number',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 160.0,
                  fontFamily: 'Roboto',
                ),
              ),
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // RAISED BUTTON

                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: addNumbers,
                    child: new Text("Add"),
                  ),

                  SizedBox(height: 20.0,),

                  //FLAT BUTTON

                  new FlatButton(
                    onPressed: subtractNumbers,
                    textColor: Colors.red,

                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Subtract",
                    ),
                  ),

                  SizedBox(height: 20.0,),

                  // OUTLINE BUTTON

                  new OutlineButton(
                      color: Colors.blueAccent,
                      textColor: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Reset'),
                      onPressed: resetNumber),

                  SizedBox(height: 20.0,),

                  // DROPDOWN BUTTON

                  DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['One', 'Two', 'Three', 'Four']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Text(value),
                        ),
                      );
                    }).toList(),
                  )
                  //
                ],
              )
            ],
          ),
        ));
  }
}
