import 'package:arunmall/env/appexports.dart';

 mymaterialapp(){
  return GetMaterialApp(
    initialRoute: "/",
    theme: genratetheme(),
    getPages: genratreroutes(),
  );
}

genratetheme(){
  return ThemeData(
    scaffoldBackgroundColor:whitebg,
    colorScheme: ColorScheme.fromSeed(seedColor: primary)
  );
}
MediaQueryData genratemediaquery(context){
  return MediaQuery.of(context);
}
genratreroutes(){
  return [GetPage(name: "/", page:()=>const Splash()),
  GetPage(name: "/login", page: ()=> const Login()),
  GetPage(name: "/shop", page: ()=>const Shoplanding()),
  GetPage(name: "/owner", page: ()=>const Adminlanding()),
  GetPage(name: "/hotel", page: ()=>const Hotelanding())
  ];
}

navigatepage({required page,arguments,required navigationtype}){
  navigationtype(page,arguments: arguments);
}
goback(){
  Get.back();
}