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
    box.write("token",user["token"]);
    navigateuser();
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