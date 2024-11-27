import 'dart:convert';
import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Api extends GetConnect{
  Future<dynamic>? loginmethod({body,endpoint})async{
    try {
      final url = "$baseurl$endpoint";
      // log(url.toString());
      // log(body.toString());
      final response =  await post(url,body,headers: headers);
      //log(response.body.toString());
      // log(response.headers.toString());
      // log(response.isOk.toString());
      // log(response.statusText.toString());
      if(response.isOk){
        //log("sucess");
        //log("Actual Response ${response.body}");
       final extractres = response.body;
       //log("Respinse Api $extractres");
      return extractres?["data"];
      }
      else{
       return null;
      }
     
    } catch (e) {
      log("Api Error ${e.toString()}");
      return null;
    }
  }
  Future<dynamic>? postmethod({body,endpoint})async{
    try {
      final url = "$baseurl$endpoint";
      final response =  await post(url, body,headers: domainheaders());
      final extractres = json.decode(response.body);
      return extractres?["data"];
    } catch (e) {
      return null;
    }
  }
}
