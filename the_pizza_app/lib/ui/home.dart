import 'package:flutter/material.dart';
import '../widgets/pizza_image.dart';
import '../widgets/order_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
            color: Colors.deepOrangeAccent,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Margherita",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "Tomato, Mozzarella, Basil",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                      ),
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Marinara",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                      ),
                    )),
                    Expanded(
                        child: Text(
                      "Tomato, Garlic",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.normal,
                      ),
                    ))
                  ],
                ),
                PizzaImageWidget(),
                OrderButton(),
              ],
            )));
  }
}
