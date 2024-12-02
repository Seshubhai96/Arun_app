import 'package:arunmall/env/appexports.dart';

const baseurl = "http://192.168.1.61:8081/api/v1/";
//"http://localhost:8081/api/v1/";

const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  "Access-Control-Allow-Origin": "*",
};

domainheaders() {
  final bx = GetStorage();
  final token = bx.read("token");
  //log(token.toString());
  return {
    'Content-Type': 'application/json; charset=utf-8',
    'Accept': 'application/json, text/plain, */*',
    "Access-Control-Allow-Origin": "*",
    'Authorization': '$token',
  };
}
