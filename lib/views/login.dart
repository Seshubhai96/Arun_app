import 'package:arunmall/controller/logincontroller.dart';
import 'package:arunmall/env/appexports.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              final ctrl = Get.put(Logincontroller());
              ctrl.login(
                  endpoint: "auth/login",
                  body: {"email":"arun@gmail.com", "password":"Arun@123"});
            },
            child: Text("Login")),
      ),
    );
  }
}
