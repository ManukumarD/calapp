import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // StatelessWidget are kind of static can not change their state.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //statefullwidget is dynamic where make changes as a response to user action.
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";//this will be the vbl that hold our output until we update the output.
  double num1 = 0.0;
  double num2 = 0.0;//since caring about the binary operations num1 and num1 store the numbers.
  String operand = "";//the value of the operand.

  buttonPressed(String buttonText) {
    //perfrom mathematical operations with following code.
    if (buttonText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "÷" ||
        buttonText == "x") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "÷") {
        _output = (num1 / num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget button(String buttonText) {
    return Expanded(
      child: MaterialButton(
        padding: new EdgeInsets.all(20.0),
        shape: StadiumBorder(),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {buttonPressed(buttonText)},
        color: Colors.blueGrey,
        textColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        backgroundColor: Colors.white,
        body: new Container(
            child: new Column(//column, here child of container have more than one children
          children: <Widget>[
            Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(
                  output,
                  style: new TextStyle(
                    fontSize: 43.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            new Expanded(// it divides the vertical space in our application on the top of text widget and while row towards buttom of page.
              child: new Divider(),
            ),
            Column(//wrapping copies of num of rows and calling 'button'.
              children: [
                Row(children: [
                  button("7"),
                  button("8"),
                  button("9"),
                  button("÷")
                ]),
                Row(children: [
                  button("4"),
                  button("5"),
                  button("6"),
                  button("x")
                ]),
                Row(children: [
                  button("1"),
                  button("2"),
                  button("3"),
                  button("-")
                ]),
                Row(children: [
                  button("."),
                  button("0"),
                  button("00"),
                  button("+")
                ]),
                Row(children: [
                  button("CLEAR"),
                  button("="),
                ]),
              ],
            )
          ],
        )));
  }
}
