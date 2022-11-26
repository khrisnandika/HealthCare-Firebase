import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project/Chat/models/FirebaseHelper.dart';
import 'package:final_project/Chat/models/UserModel.dart';
import 'package:final_project/Chat/pages/HomePage.dart';
import 'package:final_project/Chat/pages/LoginPage.dart';
import 'package:final_project/Onboarding/onboarding_page.dart';
import 'package:final_project/Providers/AuthProvider.dart';
import 'package:final_project/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   User? currentUser = FirebaseAuth.instance.currentUser;
//   if(currentUser != null) {
//     // Logged In
//     UserModel? thisUserModel = await FirebaseHelper.getUserModelById(currentUser.uid);
//     if(thisUserModel != null) {
//       runApp(MyAppLoggedIn(userModel: thisUserModel, firebaseUser: currentUser));
//     }
//     else {
//       runApp(MyApp());
//     }
//   }
//   else {
//     // Not logged in
//     runApp(MyApp());
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme:
              GoogleFonts.varelaRoundTextTheme(Theme.of(context).textTheme),
        ),
        home: AnimatedSplashScreen(
            splash: 'assets/image/splashscreen.png',
            splashIconSize: 1000,
            duration: 3000,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Color(0xff0ab885),
            nextScreen: OnboardingPage()),
      ),
    );
  }
}

// class MyAppLoggedIn extends StatelessWidget {
//   final UserModel userModel;
//   final User firebaseUser;

//   const MyAppLoggedIn({Key? key, required this.userModel, required this.firebaseUser}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(userModel: userModel, firebaseUser: firebaseUser),
//     );
//   }
// }

