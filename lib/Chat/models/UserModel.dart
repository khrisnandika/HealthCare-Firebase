import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel  {
  var uid ;
  var fullname ;
  var email ;
  var profilepic ;
  // late final User firebaseUser;

  UserModel({
     this.uid,
     this.fullname,
     this.email,
     this.profilepic,
    // required this.firebaseUser
  });

  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    fullname = map["fullname"];
    email = map["email"];
    profilepic = map["profilepic"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "fullname": fullname,
      "email": email,
      "profilepic": profilepic,
    };
  }
}
