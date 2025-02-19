import 'package:archlelabsadmin/utils/app_urls.dart';
import 'package:get/get.dart';

import '../client/http_client.dart';

class AuthRepo{

  Future<Response?> login(String username, String password) async {
    var map = Map<String, dynamic>();
   
    map['username'] = username;
    map['password'] = password;
    map['grant_type'] = "password";
   
    return await THttpHelper().postwithoutbody(AppUrls.login, map,useToken: false);
  }

}