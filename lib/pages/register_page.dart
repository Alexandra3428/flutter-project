import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/utils/responsive.dart';
import 'package:flutter_crud/widgets/avatar_button.dart';
import 'package:flutter_crud/widgets/circle.dart';
import 'package:flutter_crud/widgets/register_form.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = 'register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkSize = responsive.wp(88);
    final double orangeSize = responsive.wp(57);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Color.fromARGB(255, 174, 168, 168),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -pinkSize * 0.3,
                  right: -pinkSize * 0.2,
                  child: Circle(
                    size: pinkSize,
                    colors: [
                      Colors.pinkAccent,
                      Colors.pink,
                    ],
                    key: UniqueKey(),
                  ),
                ),
                Positioned(
                  top: -orangeSize * 0.35,
                  left: -orangeSize * 0.15,
                  child: Circle(
                    size: orangeSize,
                    colors: [
                      Colors.orange,
                      Colors.deepOrangeAccent,
                    ],
                    key: UniqueKey(),
                  ),
                ),
                Positioned(
                  top: pinkSize * 0.22,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Hello!\nSign up to get started.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: responsive.dp(1.6), color: Colors.white),
                      ),
                      SizedBox(height: responsive.dp(4.5)),
                    ],
                  ),
                ),
                RegisterForm(),
                Positioned(
                  left: 15,
                  top: 10,
                  child: SafeArea(
                    child: CupertinoButton(
                      color: Colors.black26,
                      padding: EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(30),
                      child: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
