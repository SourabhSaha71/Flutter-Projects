import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  _FuelFormState createState() => _FuelFormState();
}

class _FuelFormState extends State<FuelForm> {
  final _currencies = ['Dollars', 'Euro', 'Pounds', 'Rupees'];
  final double _formDistance = 5.0;
  String _currency = 'Rupees';
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  String result = '';

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Fuel Cost Consumption Calculator'),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: _formDistance,
                  bottom: _formDistance,
                ),
                child: TextField(
                  controller: distanceController,
                  decoration: InputDecoration(
                    labelText: 'Distance',
                    hintText: 'e.g. 80',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: _formDistance,
                  bottom: _formDistance,
                ),
                child: TextField(
                  controller: avgController,
                  decoration: InputDecoration(
                    labelText: 'Distance per Unit',
                    hintText: 'e.g. 20',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: _formDistance,
                  bottom: _formDistance,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: priceController,
                        decoration: InputDecoration(
                          labelText: 'Fuel Cost',
                          hintText: 'e.g. 80',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(width: _formDistance * 5),
                    Expanded(
                      child: DropdownButton<String>(
                        items: _currencies.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _currency,
                        onChanged: (String value) {
                          _onDropDownChanged(value);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      onPressed: () {
                        setState(() {
                          result = _calculate();
                        });
                      },
                      child: Text(
                        'SUBMIT',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      textColor: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                      child: Text(
                        'RESET',
                        textScaleFactor: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              Text(result),
            ],
          )),
    );
  }

  _onDropDownChanged(String value) {
    setState(() {
      this._currency = value;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);
    double _totalCost = _distance / _consumption * _fuelCost;
    String _result = 'The total cost of your trip is ' +
        _totalCost.toStringAsFixed(2) +
        ' ' +
        _currency;
    return _result;
  }

  void _reset() {
    distanceController.text = '';
    avgController.text = '';
    priceController.text = '';
    setState(() {
      result = '';
    });
  }
}