import 'package:canteen_food_ordering_app/apis/authentication_service.dart';
import 'package:canteen_food_ordering_app/apis/foodAPIs.dart';
import 'package:canteen_food_ordering_app/screens/login.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _current = 0;
  @override
  void initState() {
    AuthenticationService authNotifier = Provider.of<AuthenticationService>(context, listen: false);
    initializeCurrentUser(authNotifier, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    final firebaseUser = context.watch<FirebaseUser>();
    if (firebaseUser != null) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
              Color.fromRGBO(255, 255, 255, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:  new AssetImage("images/logo_karah.png"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(width: 50,),
            GestureDetector(
              /*onTap: () {
                (authNotifier.user == null)? Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return null;
                    })) :
                (authNotifier.userDetails == null) ? print('wait') :
                (authNotifier.userDetails.role == 'admin')?
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AdminHomePage();
                  },
                )):  Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NavigationBarPage(selectedIndex: 1);
                  },
                ));
              },*/
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            Text(
              '',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 17,
                color: Color.fromRGBO(252, 188, 126, 1),
              ),
            ),
            SizedBox(
                height:280,
                width: double.infinity,
                child: Column(
                  children: [
                    Carousel(
                      images: [
                        Image.asset("images/1.png",fit: BoxFit.cover,),
                        Image.asset("images/2.png",fit: BoxFit.cover,),
                        Image.asset("images/3.png",fit: BoxFit.cover,),
                      ],
                      dotSize: 4.0,
                      dotSpacing: 15.0,
                      dotColor: Colors.grey,
                      indicatorBgPadding: 5.0,
                      dotIncreasedColor: Colors.blue,
                      dotBgColor: Colors.transparent,
                      autoplay: true,
                      borderRadius: true,
                    ),
                    CarouselSlider(
                      items: [
                        Text("Simplifiez vos \nprises de commandes",),
                        Text("La livraison est \ngratuite partout Abidjan"),
                        Text("Poulets tués, plumés, \nlivrés le même jour")
                      ],
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  ],

                )
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              /*onTap: () {
                (authNotifier.user == null)? Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return LoginPage();
                  })) :
                (authNotifier.userDetails == null) ? print('wait') :
                  (authNotifier.userDetails.role == 'admin')?
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return AdminHomePage();
                      },
                    )):  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return NavigationBarPage(selectedIndex: 1);
                      },
                    ));
              },*/
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "SE CONNECTER",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              /*onTap: () {
                (authNotifier.user == null)? Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SignupPage();
                    })) :
                (authNotifier.userDetails == null) ? print('wait') :
                (authNotifier.userDetails.role == 'admin')?
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return AdminHomePage();
                  },
                )):  Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return NavigationBarPage(selectedIndex: 1);
                  },
                ));
              },*/
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(221, 232, 253, 1.0),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "S'INSCRIRE",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(1, 70, 134, 1.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
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
    );
  }else{
      return LoginPage();
    }
}
}
