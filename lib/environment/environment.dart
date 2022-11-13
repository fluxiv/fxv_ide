 import 'package:fxv_ide/services/shared_services.dart';

class Environment{
  String urlApi = '127.0.0.1:4040';
  getToken () async{
    return await SharedServices().getString('token');
  }

}