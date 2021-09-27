import 'package:canteen_food_ordering_app/apis/authentication_service.dart';
import 'package:canteen_food_ordering_app/apis/foodAPIs.dart';
import 'package:canteen_food_ordering_app/models/user.dart';
import 'package:canteen_food_ordering_app/notifiers/authNotifier.dart';
import 'package:canteen_food_ordering_app/screens/adminHome.dart';
import 'package:canteen_food_ordering_app/screens/login.dart';
import 'package:canteen_food_ordering_app/screens/orderDetails.dart';
import 'package:canteen_food_ordering_app/widgets/customRaisedButton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _formKey = GlobalKey<FormState>();
  Razorpay _razorpay;
  int money = 0;
  List<User> mesUser = [];


  signOutUser() {
    /*AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    if (authNotifier.user != null) {
      signOut(authNotifier, context);
    }*/
    context.read<AuthenticationService>().signOut();
  }

  @override
  void initState() {
    /*AuthenticationService authNotifier = Provider.of<AuthenticationService>(context, listen: false);
    getUserDetails(authNotifier);*/
    super.initState();
   /* _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);*/
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    //AuthenticationService authNotifier =Provider.of<AuthenticationService>(context, listen: false);
    //AuthNotifier authNotifier =Provider.of<AuthNotifier>(context, listen: false);
    final firebaseUser = context.watch<FirebaseUser>();
    if (firebaseUser != null) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
           icon: Icon(
               Icons.arrow_back,
               color: Colors.white,
             ),
             onPressed: () {
               Navigator.pushReplacement(
                 context,
                 MaterialPageRoute(builder: (BuildContext context) {
                   return //FirstRoute();
                     AdminHomePage();
                 }),
               );
             },
         ),
          title: Text('Profile'),
          centerTitle: true,
          automaticallyImplyLeading: true,
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
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('users').where("userId",).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              /*if (snapshot != null && snapshot.data != null)
                snapshot.data.documents.forEach((data) {
                  User maUser = User(
                      displayName : data['displayName'],
                      displayLastName : data['displayLastName'],
                      email : data['email'],
                      location : data['location'],
                      password : data['password'],
                      uuid : data['uuid'],
                      role : data['role'],
                      balance : data['balance'],
                      phone : data['phone'],
                  );
                  mesUser.add(maUser);
                });*/
              return /*ListView.builder(
                  itemCount: mesUser.length,
                  itemBuilder: (BuildContext context, int index) {
                  return Card(
                      child: Column(
                          children: <Widget>[
                            Text("Commune : ${mesUser[index].displayLastName != null
                                ? mesUser[index].displayLastName
                                : "null"}"),
                            Text("uuid : ${mesUser[index].uuid != null
                                ? mesUser[index].uuid
                                : "null"}"),
                          ]
                      ),
                  );
                  }


                    );*/
              Column(
                children: snapshot.data.documents.map((document) {
                  return Container(
                    child: Center(child: Text(document['displayName']+""+document['displayLastName'])),
                  );
                }).toList(),
              );
            }
        )

        /*SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 30, right: 10),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                decoration: new BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                width: 100,
                child: Icon(
                  Icons.person,
                  size: 70,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              firebaseUser.displayName!= null
                  ? Text(
                firebaseUser.displayName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'MuseoModerno',
                  fontWeight: FontWeight.bold,
                ),
              )
                  : Text(""),
              SizedBox(
                height: 10,
              ),
              /*firebaseUser.userDetails.location != null
                  ? Text(
                authNotifier.userDetails.location,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'MuseoModerno',
                ),
              )
                  :
              Text("You don't have a user name",),*/
              SizedBox(
                height: 20,
              ),
              firebaseUser.phoneNumber!= null
                  ? Text(
                firebaseUser.phoneNumber,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'MuseoModerno',
                ),
              )
                  :
              Text("",),
              /* GestureDetector(
              onTap: (){
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return popupForm(context);
                  }
                );
              },
              child: CustomRaisedButton(buttonText: 'Add Money'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Order History",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'MuseoModerno',
              ),
              textAlign: TextAlign.left,
            ),
            myOrders(authNotifier.userDetails.uuid),*/
            ],
          ),
        ),*/
      );
    }else{
      return LoginPage();
    }
  }

  Widget myOrders(uid){
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('orders').where('placed_by', isEqualTo: uid).orderBy("is_delivered").orderBy("placed_at", descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data.documents.length > 0 ) {
          List<dynamic> orders = snapshot.data.documents;
          return Container(
            margin: EdgeInsets.only(top: 10.0),
            child:ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orders.length,
              itemBuilder: (context, int i) {
              return new GestureDetector(
                child: Card(
                  child: ListTile(
                    enabled: !orders[i]['is_delivered'],
                    title: Text("Order #${(i+1)}"),
                    subtitle: Text('Total Amount: ${orders[i]['total'].toString()} INR'),
                    trailing: Text('Status: ${(orders[i]['is_delivered'])? "Delivered" : "Pending"}')
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailsPage(orders[i])));
                },
              );
            }),
          );
        } else {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(""),
          );
        }
      },
    );
  }

  Widget popupForm(context){
    int amount = 0;
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
                  child: Text("Deposit Money", style: TextStyle(
                    color: Color.fromRGBO(255, 63, 111, 1),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String value) {
                      if(int.tryParse(value) == null) return "Not a valid integer";
                      else if(int.parse(value) < 100) return "Minimum Deposit is 100 INR";
                      else if(int.parse(value) > 1000) return "Maximum Deposit is 1000 INR";
                      else return null;
                    },
                    keyboardType: TextInputType.numberWithOptions(),
                    onSaved: (String value) {
                      amount = int.parse(value);
                    },
                    cursorColor: Color.fromRGBO(255, 63, 111, 1),
                    decoration: InputDecoration(
                      hintText: 'Money in INR',
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
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        return openCheckout(amount);
                      }
                    },
                    child: CustomRaisedButton(buttonText: 'Add Money'),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }

  void openCheckout(int amount) async {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    money = amount;
    var options = {
      'key': 'rzp_test_D5ZAPbZuM494Pw',
      'amount': money*100,
      'name': authNotifier.userDetails.displayName,
      'description': "${authNotifier.userDetails.uuid} - ${DateTime.now()}",
      'prefill': {'contact': authNotifier.userDetails.phone, 'email': authNotifier.userDetails.email},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void toast(String data){
    Fluttertoast.showToast(
      msg: data,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    addMoney(money, context, authNotifier.userDetails.uuid);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    toast("ERROR: " + response.code.toString() + " - " + response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    toast("EXTERNAL_WALLET: " + response.walletName);
    Navigator.pop(context);
  }
}
