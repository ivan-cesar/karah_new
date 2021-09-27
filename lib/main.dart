import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'apis/authentication_service.dart';
import 'screens/adminHome.dart';
import 'screens/splash_screen.dart';

// void main() {
//   runApp(MyApp());
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      MultiProvider(
        // providers: [
        // ChangeNotifierProvider(
        //   create: (_) => AuthNotifier(),
        // ),
        // ChangeNotifierProvider(
        //   create: (_) => FoodNotifier(),
        // ),
        // ],
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null,
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(body: MyApp()),
        ),
        // MyApp(),
      ),
    );
  });
}
final List<String> imgList = [
  "images/1.png",
  "images/2.png",
  "images/3.png",
];
final List<String> text = [
  "Simplifiez vos \nprises de commandes",
  "La livraison est \ngratuite partout Abidjan",
  "Poulets tués, plumés, \nlivrés le même jour",
];
final List<String> text1 = [
  "Passez toutes vos commandes de poulets\napoutchou directement depuis votre\nposition dans l'application Karah",
  "Abidjan, Bingerville et Grand Bassam, la livraison \nest à 0 FCFA quel que soit le nombre de poulets \napoutchou que vous commandez !",
  "Nos poulets sont halal, tués, plumés et livrés \nle même jour. Ce qui les rend frais à la réception. \nPassez votre commande maintenant!",
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<FirebaseUser>();
    //ajouter la vue quand l'utilsateur est  connecté ici
    if (firebaseUser != null) {
      return AdminHomePage();
    } else {
      return SplashScreen();
    }
  }
}
