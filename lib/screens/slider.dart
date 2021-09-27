import 'package:canteen_food_ordering_app/screens/size_config.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
final List<String> imagesList = [
  "images/1.png",
  "images/2.png",
  "images/3.png",
];
final List<String> titles = [
  "Simplifiez vos \nprises de commandes",
  "La livraison est \ngratuite partout Abidjan",
  "Poulets tués, plumés, \nlivrés le même jour",
];
final List<String> text1 = [
  "Passez toutes vos commandes de poulets\napoutchou directement depuis votre\nposition dans l'application Karah",
  "Abidjan, Bingerville et Grand Bassam, la livraison \nest à 0 FCFA quel que soit le nombre de poulets \napoutchou que vous commandez !",
  "Nos poulets sont halal, tués, plumés et livrés \nle même jour. Ce qui les rend frais à la réception. \nPassez votre commande maintenant!",
];

class MyAppa extends StatefulWidget {
@override
_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppa> {
int _currentIndex = 0;

@override
Widget build(BuildContext context) {
return MaterialApp(
home: Scaffold(
body: Column(
children: [
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
CarouselSlider(
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
  width: 300.0,
  height: 5000.0,
child: Container(
  width: 500.0,
  height: 2000.0,

child: Stack(
children: <Widget>[
Image.asset(
item,
fit: BoxFit.cover,
width: double.infinity,
),
Center(
child: Text(
'${titles[_currentIndex]}',
style: TextStyle(
fontSize: 14.0,
fontWeight: FontWeight.bold,
color: Colors.black45,
),
),
),
  Align(
    alignment: FractionalOffset.bottomCenter,
    child: Text(
      '${text1[_currentIndex]}',
      style: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        color: Colors.black45,
      ),
    ),
  ),
],
),
),
),
),
)
    .toList(),
),
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: imagesList.map((urlOfItem) {
int index = imagesList.indexOf(urlOfItem);
return Container(
width: 10.0,
height: 100.0,
margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
decoration: BoxDecoration(
shape: BoxShape.circle,
color: _currentIndex == index
? Color.fromRGBO(0, 0, 0, 0.8)
    : Color.fromRGBO(0, 0, 0, 0.3),
),
);
}).toList(),
)
],
),
),
);
}
}
