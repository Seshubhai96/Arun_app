
import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Api extends GetConnect{
  Future<dynamic>? loginmethod({body,endpoint})async{
    try {
      final url = "$baseurl$endpoint";
      final response =  await post(url,body,headers: headers);
      if(response.isOk){
       final extractres = response.body;
      return extractres?["data"];
      }
       return null;
    } catch (e) {
      log("Api Error ${e.toString()}");
      return null;
    }
  }
  Future<dynamic>? postmethod({body,endpoint})async{
    try {
      final url = "$baseurl$endpoint";
      final response =  await post(url, body,headers: domainheaders());
      final extractres = response.body;
      return extractres?["data"];
    } catch (e) {
      return null;
    }
  }
}
