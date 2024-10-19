import 'package:arunmall/env/appexports.dart';

const baseurl = "https://api.bluhealthapp.com/api/";


const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  "Access-Control-Allow-Origin": "*",
};

domainheaders(){
  final bx = GetStorage();
  final token = bx.read("token");
  return {
    'Content-Type': 'application/json; charset=utf-8',
    'Accept': 'application/json, text/plain, */*',
    "Access-Control-Allow-Origin": "*",
    'Authorization': 'Bearer $token',
  };
}