// ignore_for_file: prefer_const_constructors
//main.dart
//add to cart with size & quantity increment decrement in cart pg with cart badge done
import 'package:deja_brew/pages/branches_pg.dart';
import 'package:deja_brew/pages/checkout_pg.dart';
import '../models/cart.dart';
import '../pages/home_pg.dart';
import '../pages/cart_pg.dart';
import '../pages/first_pg.dart';
import '../pages/offers_pg.dart';
import '../pages/profile_pg.dart';
import '../pages/settings_pg.dart';
import '../pages/shop_pg.dart';
import '../pages/login_pg.dart';
import '../pages/register_pg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(), //Cart instance
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const FirstPg(),
        initialRoute: '/',
        routes: {
          '/LogInPage': (context) => LoginPg(),
          '/RegisterPage': (context) => RegisterPg(),
          '/HomePage': (context) => HomePg(),
          '/ShopPage': (context) => ShopPg(),
          '/CartPage': (context) => CartPg(),
          '/BranchesPg': (context) => BranchesPg(),
          '/OffersPage': (context) => OffersPg(),
          '/ProfilePage': (context) => ProfilePg(),
          '/SettingsPage': (context) => SettingsPg(),
          '/FirstPage': (context) => FirstPg(),
          '/CheckoutPg': (context) => CheckoutPg(),
        },
      ),
    );
  }
}
