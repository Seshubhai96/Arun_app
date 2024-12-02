import 'package:arunmall/env/appexports.dart';

void main() async {
  await GetStorage.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Logincontroller()),
    ChangeNotifierProvider(create: (_) => Adminlandingcontroller())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return mymaterialapp();
  }
}
