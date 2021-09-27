import 'package:canteen_food_ordering_app/apis/authentication_service.dart';
import 'package:canteen_food_ordering_app/apis/foodAPIs.dart';
import 'package:canteen_food_ordering_app/models/food.dart';
import 'package:canteen_food_ordering_app/screens/profilePage.dart';
import 'package:canteen_food_ordering_app/widgets/customRaisedButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'accueilPage.dart';
import 'cartPage.dart';
import 'home_screen_icon.dart';
import 'loaderPage.dart';
import 'login.dart';
import 'navigationBar.dart';

class AdminHomePage extends StatefulWidget {
  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyEdit = GlobalKey<FormState>();
  List<Food> _foodItems = new List<Food>();
  String name = '';
  signOutUser() {
    // AuthNotifier authNotifier =
    //     Provider.of<AuthNotifier>(context, listen: false);
    // if (authNotifier.user != null) {
    //   signOut(authNotifier, context);
    // }
    context.read<AuthenticationService>().signOut();
  }

  @override
  void initState() {
    // AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    // getUserDetails(authNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    final firebaseUser = context.watch<FirebaseUser>();
    if (firebaseUser != null) {
      return Scaffold(
        backgroundColor: Color(0xFF363567),
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () {
                signOutUser();
              },
            )
          ],
        ),
        // ignore: unrelated_type_equality_checks
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
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
                          colors: [Color(0xffFD8BAB), Color.fromRGBO(1, 70, 134, 1.0)],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 1,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: new AssetImage("images/logo_karah.png"),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        firebaseUser.displayName != null
                            ? Text(
                          "Bienvenue ${firebaseUser.displayName}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontFamily: 'MuseoModerno',
                            fontWeight: FontWeight.bold,
                          ),
                        ): Text(""),
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
                                  /*CatigoryW(
                                image: 'images/Icon1.png',
                                text: 'General',
                                color: Color(0xFF47B4FF),
                              ),*/
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0x9F3D416E),
                                    ),
                                    child: SizedBox(
                                      height: 177,
                                      width: 160,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (BuildContext context) {
                                              return //FirstRoute();
                                                NavigationBarPage(selectedIndex: 1);
                                            }),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset('images/Icon1.png'),
                                            Text('Nouvelle Commande'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0x9F3D416E),
                                    ),
                                    child: SizedBox(
                                      height: 177,
                                      width: 160,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (BuildContext context) {
                                              return //FirstRoute();
                                                NavigationBarPage(selectedIndex: 2);
                                            }),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset('images/Icon4.png'),
                                            Text('Historique'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  /*CatigoryW(
                                image: 'images/Icon2.png',
                                text: 'Transport',
                                color: Color(0xFFA885FF),
                              )*/
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0x9F3D416E),
                                    ),
                                    child: SizedBox(
                                      height: 177,
                                      width: 160,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (BuildContext context) {
                                              return //FirstRoute();
                                                NavigationBarPage(selectedIndex: 0);
                                            }),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset('images/Icon1.png'),
                                            Text('Profil'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  /*CatigoryW(
                                image: 'images/Icon3.png',
                                text: 'Shopping',
                                color: Color(0xFFFD47DF),
                              ),*/
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0x9F3D416E),
                                    ),
                                    child: SizedBox(
                                      height: 177,
                                      width: 160,
                                      child: TextButton(
                                        style: ButtonStyle(
                                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (BuildContext context) {
                                              return //FirstRoute();
                                                loaderPage();
                                            }),
                                          );
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset('images/Icon1.png'),
                                            Text('Foire aux questions'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  /*CatigoryW(
                                image: 'images/Icon4.png',
                                text: 'Bills',
                                color: Color(0xFFFD8C44),
                              )*/
                                ],
                              ),
                              SizedBox(height: 20),
                              /*Row(
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
                          ),*/
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
        ),
        // (authNotifier.userDetails == null)
        //     ? Container(
        //         padding: EdgeInsets.symmetric(vertical: 20),
        //         width: MediaQuery.of(context).size.width * 0.6,
        //         child: Text("No Items to display"),
        //       )
        //     : (authNotifier.userDetails.role == 'admin')
        //         ? adminHome(context)
        //         :
        // Container(
        //             padding: EdgeInsets.symmetric(vertical: 20),
        //             width: MediaQuery.of(context).size.width * 0.6,
        //             child: Text("No Items to display"),
        //           ),
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return popupForm(context);
                });
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(255, 63, 111, 1),
        ),*/

      );
    } else {
      return LoginPage();
    }
  }

  /*Widget adminHome(context) {
    // AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    final firebaseUser = context.watch<FirebaseUser>();
    return null,

  }*/

 /* Widget popupForm(context) {
    String itemName;
    int totalQty, price;
    return AlertDialog(
        content: Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "New Food Item",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 63, 111, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value) {
                    if (value.length > 3)
                      return "Not a valid price";
                    else if (int.tryParse(value) == null)
                      return "Not a valid integer";
                    else
                      return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                  onSaved: (String value) {
                    price = int.parse(value);
                  },
                  cursorColor: Color.fromRGBO(255, 63, 111, 1),
                  decoration: InputDecoration(
                    hintText: 'Price in INR',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                    icon: Icon(
                      Icons.attach_money,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (String value) {
                    if (value.length > 4)
                      return "QTY cannot be above 4 digits";
                    else if (int.tryParse(value) == null)
                      return "Not a valid integer";
                    else
                      return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                  onSaved: (String value) {
                    totalQty = int.parse(value);
                  },
                  cursorColor: Color.fromRGBO(255, 63, 111, 1),
                  decoration: InputDecoration(
                    hintText: 'Total QTY',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      addNewItem(itemName, price, totalQty, context);
                    }
                  },
                  child: CustomRaisedButton(buttonText: 'Add Item'),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget popupEditForm(context, Food data) {
    String itemName = data.itemName;
    int totalQty = data.totalQty, price = data.price;
    return AlertDialog(
        content: Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Form(
          key: _formKeyEdit,
          autovalidate: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Edit Food Item",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 63, 111, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: itemName,
                  validator: (String value) {
                    if (value.length < 3)
                      return "Not a valid name";
                    else
                      return null;
                  },
                  keyboardType: TextInputType.text,
                  onSaved: (String value) {
                    itemName = value;
                  },
                  cursorColor: Color.fromRGBO(255, 63, 111, 1),
                  decoration: InputDecoration(
                    hintText: 'Food Name',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                    icon: Icon(
                      Icons.fastfood,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: price.toString(),
                  validator: (String value) {
                    if (value.length > 3)
                      return "Not a valid price";
                    else if (int.tryParse(value) == null)
                      return "Not a valid integer";
                    else
                      return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                  onSaved: (String value) {
                    price = int.parse(value);
                  },
                  cursorColor: Color.fromRGBO(255, 63, 111, 1),
                  decoration: InputDecoration(
                    hintText: 'Price in INR',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                    icon: Icon(
                      Icons.attach_money,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: totalQty.toString(),
                  validator: (String value) {
                    if (value.length > 4)
                      return "QTY cannot be above 4 digits";
                    else if (int.tryParse(value) == null)
                      return "Not a valid integer";
                    else
                      return null;
                  },
                  keyboardType: TextInputType.numberWithOptions(),
                  onSaved: (String value) {
                    totalQty = int.parse(value);
                  },
                  cursorColor: Color.fromRGBO(255, 63, 111, 1),
                  decoration: InputDecoration(
                    hintText: 'Total QTY',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Color.fromRGBO(255, 63, 111, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    if (_formKeyEdit.currentState.validate()) {
                      _formKeyEdit.currentState.save();
                      editItem(itemName, price, totalQty, context, data.id);
                    }
                  },
                  child: CustomRaisedButton(buttonText: 'Edit Item'),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget popupDeleteOrEmpty(context, Food data) {
    return AlertDialog(
        content: Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  deleteItem(data.id, context);
                },
                child: CustomRaisedButton(buttonText: 'Delete Item'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  editItem(data.itemName, data.price, 0, context, data.id);
                },
                child: CustomRaisedButton(buttonText: 'Empty Item'),
              ),
            ),
          ],
        ),
      ],
    ));
  }*/
}
