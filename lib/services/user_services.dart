import 'dart:io';
import 'package:async/async.dart';
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
     String token = await Environment().getToken();
     var url = Uri.http(Environment().urlApi,'/user/putTerms', queryParams);
     return await http.put(url, headers: {
       "Content-Type": "application/json",
       "x-authorization": token
     });
   }
   getUserData(String id) async{
     final queryParam = {
       "id" : id
     };
     String token = await Environment().getToken();
     var url = Uri.http(Environment().urlApi,'/user/getUserById', queryParam);
     return await http.post(url, headers: {
       "Content-Type": "application/json",
       "x-authorization": token
     });
   }
   saveProfilePicture (String id,dynamic image,dynamic filename) async{
     // var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
     // var length = await image.length();
     // print(length);
     //String token = await Environment().getToken();
     String extension = filename.split(".").last;
     var url = Uri.http(Environment().urlApi,'/user/uploadProfilePick');
     var req = http.MultipartRequest("POST",url);
     // var multipartFile = http.MultipartFile('photo', stream, length,
     //     filename: filename);
     req.fields['id'] = id;
     // req.files.add(multipartFile);
     req.files.add(http.MultipartFile.fromBytes('photo', image,filename: filename));
     return await req.send();
   }
}