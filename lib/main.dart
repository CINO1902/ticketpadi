import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticketpadi/features/onboarding/presentation/pages/onboarding.dart';
import 'package:ticketpadi/themeprovider.dart';
import 'core/service/locator.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final pref = await SharedPreferences.getInstance();
  String? logtoken = pref.getString('jwt_token');

  await Future.delayed(Duration(seconds: 1));

  runApp(MyApp(
    token: logtoken,
  ));
  setup();
}

class MyApp extends StatefulWidget {
  MyApp({super.key, required this.token});
  String? token;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
  }

  String jwtToken = "";
  bool isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ticket Padi',
      theme: myTheme.lighttheme,
      darkTheme: myTheme.darktheme,
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),
      initialRoute: '/',
      routes: {
        '/': (context) => const Onboarding(),
        // '/login': (context) => const LoginPage(),
      },

      // home: isLoggedIn ? const MainPage(title: 'Home') : const WelcomePage(),
    );
  }
}
