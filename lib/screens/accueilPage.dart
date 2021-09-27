import 'package:canteen_food_ordering_app/apis/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen_icon.dart';
import 'navigationBar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              context.read<AuthenticationService>().signOut();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Stack(

            children: [
              Transform.rotate(
                origin: Offset(30, -60),
                angle: 2.4,
                child: Container(
                  margin: EdgeInsets.only(
                    left: 75,
                    top: 40,
                  ),
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      colors: [Color(0xffFD8BAB), Color(0xFFFD44C4)],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Glassify Transaction',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Glassify this transaction into a \n pticular catigory ',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CatigoryW(
                                image: 'images/Icon1.png',
                                text: 'General',
                                color: Color(0xFF47B4FF),
                              ),
                              CatigoryW(
                                image: 'images/Icon2.png',
                                text: 'Transport',
                                color: Color(0xFFA885FF),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CatigoryW(
                                image: 'images/Icon3.png',
                                text: 'Shopping',
                                color: Color(0xFFFD47DF),
                              ),
                              CatigoryW(
                                image: 'images/Icon4.png',
                                text: 'Bills',
                                color: Color(0xFFFD8C44),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CatigoryW(
                                image: 'images/Icon5.png',
                                text: 'Entertainment',
                                color: Color(0xFF7DA4FF),
                              ),
                              CatigoryW(
                                image: 'images/Icon6.png',
                                text: 'Grocery',
                                color: Color(0xFF43DC64),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


