import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff56A3A6),
        accentColor: Color(0xffC0D8E0),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            color: Color(0xffcad49d),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                BannrContainer(),
                BannrContainer(),
              ],
            ),
            Row(
              children: <Widget>[
                BannrContainer(),
                BannrContainer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BannrContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      //child: Text("Hello Container"),
      width: 140.0,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.yellowAccent,
          gradient: LinearGradient(
            colors: [
              Colors.purple[50],
              Colors.purple[500],
            ],
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          )),
    );
  }
}
