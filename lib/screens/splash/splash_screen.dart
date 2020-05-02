import 'package:flutter/material.dart';
import 'package:marvie_ui_kit/constant.dart';
import 'package:marvie_ui_kit/screens/splash/slider_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
             return SliderScreen();
            })
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:  AssetImage('assets/images/splash_bg.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 210.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Marvie \nIOS UI Kit",
                        style: kmaintextstyle,
                      ),
                      SizedBox(height: 15.0,),
                      Text("Build beautiful apps",
                        style: kmain3textstyle,
                      ),
                      SizedBox(height: 15.0,),
                      Container(
                        width: 320,
                        child: Text(
                          "Marvie is your top-notch multipurpose UI kit with bright and friendly colors. Full-featured and handy. Trendy.",
                          style: kregulartextstyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 121,
                  height: 228,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:  AssetImage('assets/images/splash_toys.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}