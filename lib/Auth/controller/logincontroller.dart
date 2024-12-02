import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Logincontroller extends ChangeNotifier{
  var isloginloading = false;
  login(context,{body,endpoint})async{
try {
  isloginloading=true;
  notifyListeners();
  final box = GetStorage();
  final response = await Api().loginmethod(body: body,endpoint: endpoint);
  //log("Login Response $response");
  if(response!=null){
    log("Response $response");
    final user = response["user"];
    //log(user.toString());
    box.write("type", user["type"]);
    box.write("token",response["token"]);
    navigateuser(context);
  }
  isloginloading= false;
  notifyListeners();
} catch (e) {
  log("Login Error ${e.toString()}");
  isloginloading=false;
  notifyListeners();
}
  }

var usergetbyid = false;
var currentuser = {};
getbyid()async{
try {
  usergetbyid=true;
  notifyListeners();
  final user = await Api().postmethod(endpoint: "auth/getbyid",);
  if(user!=null){
    log(user.toString());
    currentuser= user;
    notifyListeners();
  }
  usergetbyid = false;
  notifyListeners();
} catch (e) {
  log("Error GetBYid $e");
  usergetbyid=false;
  notifyListeners();
}
}
  navigateuser(context){
    final box = GetStorage();
    final role = box.read("type");
    log(role.toString());
    if(role=="Owner"){
      NavigationSlideAndRemoveUntil(context,const Adminlanding());
    }else if(role=="Shop"){
      NavigationSlideAndRemoveUntil(context,const Shoplanding());
    }else if(role=="Hotel"){
      NavigationSlideAndRemoveUntil(context,const Hotelanding());
    }else{
       NavigationSlideAndRemoveUntil(context,const Login());
    }
  }
}