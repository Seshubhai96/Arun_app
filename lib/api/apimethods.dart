import 'dart:convert';

import 'package:arunmall/env/appexports.dart';

class Api extends GetConnect{
  Future<dynamic>? loginmethod({body,endpoint})async{
    try {
      final url = "$baseurl$endpoint";
      final response =  await post(url, body,headers: headers);
      final extractres = json.decode(response.body);
      return extractres?["data"];
    } catch (e) {
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
