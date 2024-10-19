import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Apimethods extends GetConnect{
  Future<Response> loginmethod({body,endpoint})async{
    try {
      final url = "$baseurl$endpoint";
      final response =  await post(url, body,headers: headers);
      log(response.body.toString());
      return response.body;
    } catch (e) {
      return const Response(body: null);
    }
  }
}