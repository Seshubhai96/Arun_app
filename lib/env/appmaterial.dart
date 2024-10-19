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

genratreroutes(){
  return [GetPage(name: "/", page:()=>const Splash())];
}