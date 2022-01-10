import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'height in cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'weight in kg',
                icon: Icon(Icons.line_weight),
              ),
            ),
            SizedBox(height: 15),
            RaisedButton(
              color: Colors.pinkAccent,
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: calculateBMI,
            ),
            SizedBox(height: 15),
            Container(
              child: Text(
                _result == null ? '' : _result.toStringAsFixed(2),
                style: TextStyle(fontSize: 50),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text(
                _message,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  String _message = 'Please enter your height an weight';

  void calculateBMI() {
    double height = double.parse(_heightController.text) / 100;
    double weight = double.parse(_weightController.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;

    _result = result;

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _result = weight / (height * height);
      if (_result < 18.5) {
        _message = "You are underweight";
      } else if (_result < 25) {
        _message = 'You body is fine';
      } else if (_result < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    });
  }
}
