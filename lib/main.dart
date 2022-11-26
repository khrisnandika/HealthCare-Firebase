// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_project/screens/login/hello.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// const bool USE_EMULATOR = true;
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   if (USE_EMULATOR) {
//     _connectToFirebaseEmulator();
//   }
//   runApp(MyApp());
// }

// Future _connectToFirebaseEmulator() async {
//   final fireStorePort = "8090";
//   final authPort = 9099;
//   final storagePort = 9199;
//   final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
//   FirebaseFirestore.instance.settings = Settings(
//       host: "$localHost:$fireStorePort",
//       sslEnabled: false,
//       persistenceEnabled: false);

//   await FirebaseAuth.instance.useAuthEmulator(localHost, authPort);
//   await FirebaseStorage.instance.useStorageEmulator(localHost, storagePort);
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       debugShowCheckedModeBanner: false,
//       home: Hello(),
//       theme: CupertinoThemeData(
//           brightness: Brightness.light, primaryColor: Color(0xFF08C187)),
//     );
//   }
// }


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

