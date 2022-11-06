import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/detail_screen.dart';
import 'package:final_project/home.dart';
import 'package:final_project/login.dart';
import 'package:final_project/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.varelaRoundTextTheme(
          Theme.of(context).textTheme
        ),
      ),
      home: AnimatedSplashScreen(
          splash: 'assets/image/splashscreen.png',
          splashIconSize: 1000,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Color(0xff0ab885),
          nextScreen: LoginPage()),

      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         height: 100,
      //         width: 100,
      //         color: Colors.blue,
      //       ),
      //       Container(
      //         child: Text(
      //           'Splash Screen',
      //           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
