// ignore_for_file: non_constant_identifier_names

import 'package:arunmall/env/appexports.dart';

 mymaterialapp(){
  return MaterialApp(
    home: const Splash(),
    theme: genratetheme(),
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

void NavigationSlideAndRemoveUntil(BuildContext context, Widget newPage,
    {double x = 0.0, double y = 0.0}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(x, y), end: Offset.zero)
              .animate(animation),
          child: newPage,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    ),
    (route) => false,
  );
}
void NavigationScaleAndRemoveUntil(BuildContext context, Widget newPage,
    {double x = 0.0, double y = 1.0}) {
  Navigator.pushAndRemoveUntil(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return WillPopScope(
          onWillPop: () async => true, // Disable swipe-back on Android
          child: ScaleTransition(
            scale: Tween<double>(
              begin: x,
              end: y,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut, // Smooth transition
              ),
            ),
            child: newPage,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: x, end: y).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      },
    ),
    (route) => false, // Removes all previous routes
  );
}

void NavigationSlide(BuildContext context, Widget newPage,
    {double x = 0.0, double y = 0.0}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(begin: Offset(x, y), end: Offset.zero)
              .animate(animation),
          child: newPage,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    ),
  );
}
void NavigationScale(BuildContext context, Widget newPage,
    {double x = 0.0, double y = 1.0}) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return WillPopScope(
          onWillPop: () async => true, // Disable swipe-back on Android
          child: ScaleTransition(
            scale: Tween<double>(
              begin: x,
              end: y,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut, // Smooth transition
              ),
            ),
            child: newPage,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: x, end: y).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            ),
          ),
          child: child,
        );
      },
    ),
  );
}

// genratreroutes(){
//   return [GetPage(name: "/", page:()=>const Splash()),
//   GetPage(name: "/login", page: ()=> const Login()),
//   GetPage(name: "/shop", page: ()=>const Shoplanding()),
//   GetPage(name: "/owner", page: ()=>const Adminlanding()),
//   GetPage(name: "/hotel", page: ()=>const Hotelanding())
//   ];
// }

// navigatepage({required page,arguments,required navigationtype}){
//   navigationtype(page,arguments: arguments);
// }
// goback(){
//   Get.back();
// }