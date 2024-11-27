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
    // box.write("type", response["type"]);
    // box.write("token",response?["token"]);
    //navigateuser();
  }
  isloginloading.value= false;
} catch (e) {
  log("Login Error ${e.toString()}");
  isloginloading.value=false;
}
  }
  navigateuser(){
    final box = GetStorage();
    final role = box.read("type");
    if(role=="Owner"){
log("owner");
    }else if(role=="Shop"){
log("shop");
    }else if(role=="Lodge"){
log("other");
    }else{
      navigatepage(page: "/login");
    }
  }
}