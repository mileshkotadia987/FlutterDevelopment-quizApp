import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFuntions{
  static String userLoggedInKey="USERLOGGEDINKEY";
  static saveUserLoggedInDetails({@required bool isLoggedIn})async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    preferences.setBool(userLoggedInKey, isLoggedIn);
  }

  static Future<bool> getUserLoggedInDetails()async{
    SharedPreferences preferences=await SharedPreferences.getInstance();
    return preferences.getBool(userLoggedInKey);
  }
}