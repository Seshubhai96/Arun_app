import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Logincontroller extends GetxController{
  RxBool isloginloading = false.obs;
  login({body,endpoint})async{
try {
  isloginloading.value=true;
  final box = GetStorage();
  final response = await Api().loginmethod(body: body,endpoint: endpoint);
  //log("Login Response $response");
  if(response!=null){
    log("Response $response");
    final user = response["user"];
    //log(user.toString());
    box.write("type", user["type"]);
    box.write("token",response["token"]);
    navigateuser();
  }
  isloginloading.value= false;
} catch (e) {
  log("Login Error ${e.toString()}");
  isloginloading.value=false;
}
  }

RxBool usergetbyid = false.obs;
var currentuser = {}.obs;
getbyid()async{
try {
  usergetbyid.value=true;
  final user = await Api().postmethod(endpoint: "auth/getbyid",);
  if(user!=null){
    log(user.toString());
    currentuser.value = user;
  }
  usergetbyid.value = false;
} catch (e) {
  log("Error GetBYid $e");
  usergetbyid.value=false;
}
}
  navigateuser(){
    final box = GetStorage();
    final role = box.read("type");
    log(role.toString());
    if(role=="Owner"){
      navigatepage(page: "/owner",navigationtype: Get.offNamed);
    }else if(role=="Shop"){
       navigatepage(page: "/shop",navigationtype: Get.offNamed);
    }else if(role=="Hotel"){
       navigatepage(page: "/hotel",navigationtype: Get.offNamed);
    }else{
      navigatepage(page: "/login",navigationtype: Get.offNamed);
    }
  }
}