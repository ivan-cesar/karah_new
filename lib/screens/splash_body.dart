import 'package:canteen_food_ordering_app/screens/constants.dart';
import 'package:canteen_food_ordering_app/screens/default_button.dart';
import 'package:canteen_food_ordering_app/screens/login.dart';
import 'package:canteen_food_ordering_app/screens/signup.dart';
import 'package:canteen_food_ordering_app/screens/splash_content.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'size_config.dart';

// This is the best practice

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  static String routeName = "/splash";
  int _currentIndex = 0;
  int currentPage = 0;
  final List<String> imagesList = [
    "images/1.png",
    "images/2.png",
    "images/3.png",
  ];
  final List<String> titles = [
    "Simplifiez vos prises de commandes",
    "La livraison est gratuite partout Abidjan",
    "Poulets tués, plumés, livrés le même jour",
  ];
  final List<String> text1 = [
    "Passez toutes vos commandes de poulets\napoutchou directement depuis votre\nposition dans l'application Karah",
    "Abidjan, Bingerville et Grand Bassam, la livraison \nest à 0 FCFA quel que soit le nombre de poulets \napoutchou que vous commandez !",
    "Nos poulets sont halal, tués, plumés et livrés \nle même jour. Ce qui les rend frais à la réception. \nPassez votre commande maintenant!",
  ];
  List<Map<String, String>> splashData = [
    {
      "image": "images/1.png",
      "text1": "Simplifiez vos \nprises de commandes",
      "text":
          "Passez toutes vos commandes de poulets\napoutchou directement depuis votre\nposition dans l'application Karah"
    },
    {
      "text1": "La livraison est \ngratuite partout Abidjan",
      "text":
          "Abidjan, Bingerville et Grand Bassam, la livraison \nest à 0 FCFA quel que soit le nombre de poulets \napoutchou que vous commandez !",
      "image": "images/2.png"
    },
    {
      "text1": "Poulets tués, plumés, \nlivrés le même jour",
      "text":
          "Nos poulets sont halal, tués, plumés et livrés \nle même jour. Ce qui les rend frais à la réception. \nPassez votre commande maintenant!",
      "image": "images/3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: getProportionateScreenHeight(120),
                    width: getProportionateScreenWidth(112),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:  new AssetImage("images/logo_karah.png"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),

                  SizedBox(width: 50,),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(1, 70, 134, 1.0)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "J'AI UNE QUESTION",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromRGBO(1, 70, 134, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
// enlargeCenterPage: true,
//scrollDirection: Axis.vertical,
                    onPageChanged: (index, reason) {
                      setState(
                            () {
                          _currentIndex = index;
                        },
                      );
                    },
                  ),
                  items: imagesList
                      .map(
                        (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Container(
                            width: 500.0,
                            height: 2000.0,

                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  flex: 0,
                                  child: Image.asset(
                                    item,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                //SizedBox(height: 1,),
                                Expanded(
                                  flex: 0,
                                  child: Align(
                                      alignment: FractionalOffset.bottomCenter,
                                      child:
                                      Text(
                                        '${titles[_currentIndex]}',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(1, 70, 134, 1.0),
                                        ),
                                      ),
                                  ),
                                ),
                                Expanded(
                                  flex: 0,
                                  child: Align(
                                    alignment: FractionalOffset.bottomCenter,
                                    child: Text(
                                      '${text1[_currentIndex]}',
                                      style: TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12,
                                        color: Color.fromRGBO(1, 70, 134, 1.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ),

              ),
              Expanded(
                flex: 1,
                child: Padding(
                  // padding: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      Spacer(flex: 1),
                      DefaultButton(
                        text: "SE CONNECTER",
                        press: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                      ),
                      SizedBox(height: 10.0),
                      MozartButton(
                        text: "S' INSCRIRE",
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                      ),
                      Spacer(),
                      Text(
                        'POWERD BY PROPULSE GROUP',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(1, 70, 134, 1.0),
                          //fontFamily: 'MuseoModerno',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    fun();
  }
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
  Color myColor = Colors.orange;
  Future fun ()async{
    for(int i =0 ; i  < splashData.length ; i ++){
      await Future.delayed( Duration(seconds:currentPage), () {
        setState(() {
          if(i  == 0){
            myColor = Colors.green;
          } else if (i  == 1){
            myColor = Colors.blue;
          }
          else if (i  == 2){
            myColor = Colors.yellowAccent;
          }
        });
      });
    }
  }
}
