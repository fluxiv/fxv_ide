import 'package:flutter/material.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:fxv_ide/views/feed/feed_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedServices{
  saveString(String key,String value ) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key,value);
  }
  getString(String key) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
  eraseAndGoTo(context, routeName){
    Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
          (Route<dynamic> route) => false,
    );
  }
  goWithParams(context,route,dynamic params){
    Navigator.of(context).popAndPushNamed('/feed',arguments:params);
  }
}