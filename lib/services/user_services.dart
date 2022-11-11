import 'package:http/http.dart' as http;
import 'package:fxv_ide/environment/environment.dart';
import 'dart:convert';

class UserServices {
//final String baseUrl = Environment().urlApi
   postUser (dynamic params) async{
     var body = json.encode(params);
    var url = Uri.http(Environment().urlApi,'/user/postUser');
    return await http.post(url,body: body,headers: {
     "Content-Type": "application/json"});
  }
   loginUser (dynamic params) async{
     var body = json.encode(params);
     var url = Uri.http(Environment().urlApi,'/user/loginUser');
     return await http.post(url,body:body,headers: {"Content-Type": "application/json"});
   }
}