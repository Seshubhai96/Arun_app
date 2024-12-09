// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Profileupdate extends StatefulWidget {
  final userid;
  const Profileupdate({super.key, required this.userid});

  @override
  State<Profileupdate> createState() => _ProfileupdateState();
}

class _ProfileupdateState extends State<Profileupdate> {
  String? selectedGender;
  final List<String> genderOptions = ['Male', 'Female', 'Other'];
  bool isswitched = false;
  final key = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((val) {
      Provider.of<Userscontroller>(context, listen: false)
          .getbyuserid(payload: widget.userid);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<Userscontroller, Logincontroller, Filepickercontroller>(
        builder: (context, userctrl, auth, filectrl, child) {
      return Scaffold(
        backgroundColor: whitebg,
        appBar: const Themeappbar(
          title: "Update Profile",
          isback: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 160,
                    width: genratemediaquery(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), color: grey),
                    child: Column(
                      children: [
                        const Appsized(height: 10),
                        networkImages(
                            url: userctrl.usersModel.image ??
                                "assets/swagth.jpg",
                            size: 100.0),
                        const Appsized(height: 10),
                        Apptextwidget(
                          "Please update Your profile",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: black, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const Appsized(height: 10),
                  Apptextwidget(
                    "Full Name:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: black, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: userctrl.usersModel.fullname,
                    validator: Appvalidator.namevalidator,
                    decoration: const InputDecoration(
                      isDense: true,

                      //contentPadding: EdgeInsets.zero,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                  ),
                  const Appsized(height: 15),
                  Apptextwidget(
                    "Email:",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: black, fontWeight: FontWeight.w500),
                  ),
                  TextFormField(
                    controller: userctrl.usersModel.email,
                    validator: Appvalidator.emailvalidator,
                    decoration: const InputDecoration(
                      isDense: true,
                      //contentPadding: EdgeInsets.zero,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Apptextwidget(
                        "Gender:",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: black, fontWeight: FontWeight.w500),
                      ),
                      Apptextwidget(
                        "Role:  ",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: black, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const Appsized(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: genratemediaquery(context).size.width / 2.5,
                        child: MydropDown(
                            items: genderOptions,
                            onChanged: (val) {
                              userctrl.changegender(val);
                            },
                            value: userctrl.usersModel.gender),
                      ),
                      SizedBox(
                        width: genratemediaquery(context).size.width / 2.5,
                        child: MydropDownApi(
                            mandatory: true,
                            items: userctrl.userrolelist
                                .map((r) => DropdownMenuItem(
                                    value: r.rolename,
                                    child: Apptextwidget(r.rolename ?? "")))
                                .toList(),
                            onChanged: (val) {
                              userctrl.changerole(val);
                            },
                            value: userctrl.usersModel.role),
                      ),
                    ],
                  ),
                  const Appsized(height: 10),
                  Visibility(
                    visible: userctrl.usersModel.type != "Owner",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.hotel,
                          size: 30,
                        ),
                        Transform.scale(
                            scale: 0.80,
                            child: Switch(
                                value: userctrl.usersModel.type == 'Shop',
                                onChanged: (val) {
                                  userctrl.changetype(val ? "Shop" : "Hotel");
                                })),
                        const Icon(
                          Icons.shopping_cart,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  const Appsized(height: 10),
                  fillButton(context,
                      load: auth.userupdatebyid || userctrl.usergetbyid,
                      title: "Submit", onTap: () {
                    if (key.currentState!.validate() &&
                        userctrl.usersModel.gender != null) {
                      auth.updatebyid(
                          payload: userctrl.usersModel.toJson(),
                          call: userctrl.getbyuserid(payload: widget.userid));
                      log(userctrl.usersModel.toJson().toString());
                    }
                  })
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
