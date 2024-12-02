import 'dart:convert';
import 'dart:developer';

import 'package:arunmall/env/appexports.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic>? loginmethod({body, endpoint}) async {
    try {
      final url = Uri.parse("$baseurl$endpoint");
      final response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final extractres = json.decode(response.body);
        return extractres?["data"];
      }
      return null;
    } catch (e) {
      log("Api Error ${e.toString()}");
      return null;
    }
  }

  Future<dynamic>? postmethod({body, endpoint}) async {
    try {
      final url = Uri.parse("$baseurl$endpoint");
      //log(url);
      final response = await http.post(url,
          body: jsonEncode(body ?? {}), headers: domainheaders());
      //log(domainheaders().toString());
      if (response.statusCode == 200) {
        final extractres = json.decode(response.body);
        return extractres?["data"];
      }
      //log(response.body.toString());
      return null;
    } catch (e) {
      final url = "$baseurl$endpoint";
      log("PostApi error $url $e");
      return null;
    }
  }
}
