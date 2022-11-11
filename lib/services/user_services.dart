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

   updateTerms (dynamic params) async{
     final queryParams = {
       "id": params["id"],
       "bool": params["bool"]
     };
     var url = Uri.http(Environment().urlApi,'/user/putTerms', queryParams);
     return await http.put(url, headers: {
       "Content-Type": "application/json",
       "x-authorization": "eyJhbGciOiJIUzI1NiJ9.WlV1Wnk1bEo1Y0Z3ZXRpWFp1cVk5.0q4HbRRsvIcPx8vKRqx49k-wL3tPrmLrco1ZzC8GkXI"
     });
   }
}