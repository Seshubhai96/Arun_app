
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
      //log(url);
      final response =  await post(url, body,headers: domainheaders());
      //log(domainheaders().toString());
      if(response.isOk){
       final extractres = response.body;
      return extractres?["data"];
      }
      log(response.body.toString());
       return null;
    } catch (e) {
      final url = "$baseurl$endpoint";
      log("PostApi error $url $e");
      return null;
    }
  }
}
