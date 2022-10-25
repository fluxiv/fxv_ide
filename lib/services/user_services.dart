import 'package:http/http.dart' as http;
import 'package:fxv_ide/environment/environment.dart';

class UserServices {
//final String baseUrl = Environment().urlApi
   postUser (params) async{

    var url = Uri.https(Environment().urlApi,'postUser');
    var response = await http.post(url,body: params);
  }
}