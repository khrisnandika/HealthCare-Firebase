import 'package:final_project/Chat/models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;
  Future<Map> setUser(user) async {
    _user = user;
    notifyListeners();
    return {
      'OK': 'ad',
    };
  }

  UserModel get getUser => _user!;
}
