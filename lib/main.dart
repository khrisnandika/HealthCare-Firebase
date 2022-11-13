import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project/Onboarding/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
          nextScreen: OnboardingPage()),
    );
  }
}

