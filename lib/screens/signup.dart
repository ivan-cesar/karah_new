import 'package:canteen_food_ordering_app/apis/authentication_service.dart';
import 'package:canteen_food_ordering_app/apis/foodAPIs.dart';
import 'package:canteen_food_ordering_app/notifiers/authNotifier.dart';
import 'package:canteen_food_ordering_app/screens/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:canteen_food_ordering_app/models/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _passwordController = new TextEditingController();

  User _user = new User();
  bool isSignedIn = false, showPassword = true, showConfirmPassword = true;
  
  @override
  void initState() {
    AuthenticationService authNotifier = Provider.of<AuthenticationService>(context, listen: false);
    initializeCurrentUser(authNotifier, context);
    super.initState();
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

  void _submitForm() {
    if (!_formkey.currentState.validate()) {
      return;
    }
    _formkey.currentState.save();
    RegExp regExp = new RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$');
    //AuthNotifier authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    if(_user.displayName.length < 3){
      toast("Name must have atleast 3 characters");
    } /*else if(!regExp.hasMatch(_user.email)){
      toast("Enter a valid Email ID");
    }*/ else if(_user.phone.length != 10){
      toast("Contact number length must be 10");
    } else if(int.tryParse(_user.phone) == null){
      toast("Contact number must be a number");
    } else if(_user.password.length < 8){
      toast("Password must have atleast 8 characters");
    } else if(_passwordController.text.toString() != _user.password){
      toast("Confirm password does'nt match your password");
    } else {
      print("Success");
      _user.role = "user";
      _user.balance = 0.0;
      signUp(_user, context);
    }
  }
  Color bulbColor = Color.fromRGBO(1, 70, 134, 1.0);
  Widget _buildSignUPForm() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        // User Name Field
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color.fromRGBO(24, 142, 190, 1.0)),
              borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (String value) {
              return null;
            },
            onSaved: (String value) {
              _user.displayName = value;
            },
            cursorColor: Color.fromRGBO(1, 70, 134, 1.0),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Votre nom',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
              icon: Icon(
                Icons.account_circle,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
            ),
          ),
        ),
        // Email Field
        /*Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color.fromRGBO(24, 142, 190, 1.0)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            validator: (String value) {
              return null;
            },
            onSaved: (String value) {
              _user.email = value;
            },
            keyboardType: TextInputType.emailAddress,
            cursorColor:Color.fromRGBO(1, 70, 134, 1.0),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Email',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
              icon: Icon(
                Icons.email,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
            ),
          ),
        ),*/
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color.fromRGBO(24, 142, 190, 1.0)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (String value) {
              return null;
            },
            onSaved: (String value) {
              _user.displayLastName = value;
            },
            cursorColor: Color.fromRGBO(1, 70, 134, 1.0),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Votre prénom',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
              icon: Icon(
                Icons.account_circle,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        //Phone Number Field
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color.fromRGBO(24, 142, 190, 1.0)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            validator: (String value) {
              return null;
            },
            onSaved: (String value) {
              _user.phone = value;
            },
            keyboardType: TextInputType.number,
            cursorColor:Color.fromRGBO(1, 70, 134, 1.0),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Numero de téléphone',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
              icon: Icon(
                Icons.phone,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color.fromRGBO(24, 142, 190, 1.0)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: (String value) {
              return null;
            },
            onSaved: (String value) {
              _user.location = value;
            },
            cursorColor: Color.fromRGBO(1, 70, 134, 1.0),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Adresse géographique',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
              icon: Icon(
                Icons.location_on,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Password Field
        Text(" Sélectionner votre statut !",
          style: TextStyle(fontSize: 20,
          color: Color.fromRGBO(1, 70, 134, 1.0)),
        ),
        Container(
          width: 280,
          child: Row(
            children: <Widget>[
              Radio(
                  value: Colors.red,
                  groupValue: bulbColor,
                  onChanged: (val) {
                    setState(() {
                         bulbColor = val;
                    });
                  }),
              Text(
                'Professionnel (Activité)',
                style: TextStyle(fontSize: 20,
                color: Color.fromRGBO(1, 70, 134, 1.0)),
              )
            ],
          ),
        ),
        Container(
          width: 280,
          child: Row(
            children: <Widget>[
              Radio(
                  value: Color.fromRGBO(1, 70, 134, 1.0),
                  groupValue: bulbColor,
                  onChanged: (val) {
                    setState(() {
                    bulbColor = val;
                    });
                  }),
              Text('Particulier (Ménages)',
                  style: TextStyle(fontSize: 20,
                    color: Color.fromRGBO(1, 70, 134, 1.0)),)
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(24, 142, 190, 1.0)),
            color: mPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            obscureText: showPassword,
            validator: (String value) {
              return null;
            },
            onSaved: (String value) {
              _user.password = value;
            },
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Color.fromRGBO(1, 70, 134, 1.0),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  (showPassword) ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromRGBO(1, 70, 134, 1.0),
                ), 
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                }
              ),
              border: InputBorder.none,
              hintText: 'Créer votre mot de passe',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
              icon: Icon(
                Icons.lock,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Confirm Password Field
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(24, 142, 190, 1.0)),
            color: mPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            validator: (String value) {
              return null;
            },
            obscureText: showConfirmPassword,
            keyboardType: TextInputType.visiblePassword,
            controller: _passwordController,
            cursorColor: Color.fromRGBO(1, 70, 134, 1.0),
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  (showConfirmPassword) ? Icons.visibility_off : Icons.visibility,
                  color: Color.fromRGBO(1, 70, 134, 1.0),
                ), 
                onPressed: () {
                  setState(() {
                    showConfirmPassword = !showConfirmPassword;
                  });
                }
                ),
              border: InputBorder.none,
              hintText: 'Confirmer votre mot de passe',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
              icon: Icon(
                Icons.lock,
                color: Color.fromRGBO(1, 70, 134, 1.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // Sign Up Button
        GestureDetector(
          onTap: () {
            _submitForm();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            decoration: BoxDecoration(
              color: Color.fromRGBO(1, 70, 134, 1.0),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Créer mon compte",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(255, 255, 255, 1.0),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // Login Line
        /*Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already a registered user?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Text(
                  'Log In here',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),*/
        SizedBox(
          height: 0,
        ),
      ],
    );
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        /*decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(255, 138, 120, 1),
              Color.fromRGBO(255, 114, 117, 1),
              Color.fromRGBO(255, 63, 111, 1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),*/
        child: Form(
          key: _formkey,
          autovalidate: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage("images/logo_karah.png"),
                          fit: BoxFit.cover)),
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.only(top: 60),
                    child: Text(
                      "Créer votre compte",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(1, 70, 134, 1.0),
                        fontFamily: 'MuseoModerno',
                      ),
                    ),
                  ),
                ),
                Text(
                  "C'est gratuit, simple et sans engagement !",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 17,
                    color: Color.fromRGBO(1, 70, 134, 1.0),
                  ),
                ),
                _buildSignUPForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
