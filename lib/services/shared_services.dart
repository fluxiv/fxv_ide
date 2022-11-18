import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedServices{
  getShared() async{
    return await SharedPreferences.getInstance();
  }
  saveString(String key,String value ) async{
    SharedPreferences prefs = await getShared();
    prefs.setString(key,value);
  }
  getString(String key) async{
    SharedPreferences prefs = await getShared();
    return prefs.getString(key);
  }
  eraseAndGoTo(context,route){
    Navigator.popAndPushNamed(context, '/terms');
  }
}