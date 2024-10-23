import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Logincontroller extends GetxController{
  RxBool isloginloading = false.obs;
  login({body,endpoint})async{
try {
  isloginloading.value=true;
  final box = GetStorage();
  final response = await Api().loginmethod(body: body,endpoint: endpoint);
  if(response!=null){
    box.write("type", response["type"]);
    box.write("token",response?["token"]);
    navigateuser();
  }
  isloginloading.value= false;
} catch (e) {
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