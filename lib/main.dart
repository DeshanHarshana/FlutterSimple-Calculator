import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  var g=9;
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Calculater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = '0';

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operend = "";

  buttonPress(String buttenText) {
    if (buttenText == "CLEAR") {
      _output = "0";
      num1 = 0.0;
       num2 = 0.0;
     operend = "";
    } else if(buttenText=="+" || buttenText=="-" ||buttenText=="X" ||buttenText=="÷"){
      num1=double.parse(output);
      operend=buttenText;
      _output="0";
    }
    else if(buttenText=="."){
      if(_output.contains(".")){
      print("Already Contain Decimal");
      return;
      }
      else{
      _output=_output + buttenText;
    }
    
    }
    else if(buttenText=="="){
      num2=double.parse(output);

      if(operend=="+"){
        _output=(num1+num2).toString();
      }
      if(operend=="-"){
        _output=(num1-num2).toString();
      }
      if(operend=="X"){
        _output=(num1*num2).toString();
      }
      if(operend=="÷"){
        _output=(num1/num2).toString();
      }

      num1=0.0;
      num2=0.0;
      operend="";


    }
    else{
      _output=_output+buttenText;
    }
    print(output);
    setState(() {
      output=double.parse(_output).toString();
    });
    
    
  }

  Widget buildButton(String text) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(28.0),
        onPressed: () => buttonPress(text),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            child: new Column(
          children: <Widget>[
            Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 38.0,
                ),
                child: Text(
                  output,
                  style: TextStyle(
                    fontSize: 72.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Expanded(child: Divider()),
            Column(
              children: <Widget>[
                Row(children: [
                  buildButton('9'),
                  buildButton('8'),
                  buildButton('7'),
                  buildButton('÷'),
                ]),
                Row(children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildButton('X'),
                ]),
                Row(children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildButton('-'),
                ]),
                Row(children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('00'),
                  buildButton('+'),
                ]),
                Row(children: [
                  buildButton('CLEAR'),
                  buildButton('='),
                ]),
              ],
            )
          ],
        )));
  }
}
