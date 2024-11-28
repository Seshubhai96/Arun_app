import 'package:arunmall/env/appexports.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool pwdvisible = false;
  final key = GlobalKey<FormState>();
  final ctrl = Get.find<Logincontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/swagth.jpg"),
          fit: BoxFit.cover,
        )),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          height: Get.height / 2,
          width: Get.width,
          decoration: const BoxDecoration(
            color: whitebg,
            borderRadius: BorderRadius.only(topRight: Radius.circular(50)),
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: key,
            child: Column(
              children: [
                Apptextwidget(
                  "Login",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(color: black, fontWeight: FontWeight.bold),
                ),
                const Appsized(
                  height: 10,
                ),
                Apptextwidget(
                  "Sign in to Continue",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                const Appsized(
                  height: 10,
                ),
                CupertinoFormSection(
                    header: Apptextwidget(
                      "Welcome Back 🙏",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    children: [
                      CupertinoFormRow(
                          child: apptextfield(
                              controller: emailcontroller,
                              label: "Email",
                              hint: "Enter Your Email",
                              prfix: const Icon(Icons.email),
                              validator: Appvalidator.emailvalidator)),
                      CupertinoFormRow(
                          child: apptextfield(
                              prfix: const Icon(Icons.lock),
                              label: "Password",
                              controller: passwordcontroller,
                              validator: Appvalidator.passwordvalidate,
                              ishidden: pwdvisible,
                              // sufix: IconButton(
                              //     onPressed: () {
                              //       setState(() {
                              //         pwdvisible = !pwdvisible;
                              //       });
                              //     },
                              //     icon: Icon(pwdvisible
                              //         ? Icons.visibility_off
                              //         : Icons.visibility))
                                      ))
                    ]),
                Obx(()=>Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: fillButton(context, load: ctrl.isloginloading.value, title: "Login",
                      onTap: () {
                    if (key.currentState!.validate()) {
                      final ctrl = Get.put(Logincontroller());
                      ctrl.login(endpoint: "auth/login", body: {
                        "email": emailcontroller.text,
                        "password": passwordcontroller.text
                      });
                    }
                  }),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
Center(
        child: ElevatedButton(
            onPressed: () {
              final ctrl = Get.put(Logincontroller());
              ctrl.login(
                  endpoint: "auth/login",
                  body: {"email":"arun@gmail.com", "password":"Arun@123"});
            },
            child: Text("Login")),
      ),
*/