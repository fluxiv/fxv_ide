import 'package:flutter/material.dart';
import 'package:fxv_ide/models/user_models.dart';
import 'package:fxv_ide/views/feed/feed_container.dart';
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
    Navigator.popAndPushNamed(context, route);
  }
  goWithParams(context,route,dynamic params){
    Navigator.of(context).popAndPushNamed('/feed',arguments:params);
  }
}