// ignore_for_file: invalid_use_of_protected_member

import 'package:arunmall/env/appexports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Logincontroller>(builder: (_,ctrl,child){
      return ctrl.isloginloading?const Loader()
        : SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              height: genratemediaquery(context).size.height,
              width: genratemediaquery(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Profile Card
                  Center(
                      child: Column(
                    children: [
                      //networkImages(url: "assets/swagth.jpg", size: 100.0),
                      Apptextwidget(
                        "${ctrl.currentuser["fullname"] ?? ""}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Apptextwidget(
                        "${ctrl.currentuser["email"] ?? ""}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.w300),
                      ),
                      ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(backgroundColor: black),
                          onPressed: () {},
                          child: Apptextwidget(
                            "Edit Profile",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(color: whitebg),
                          ))
                    ],
                  )),
                  const Appsized(height: 10),
                  /// preferncies
                  Apptextwidget(
                    "Preferences",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Card(
                    color: grey,
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.exit_to_app,
                            size: 20,
                           // color: meroonclr,
                          ),
                          title: Apptextwidget(
                            "LogOut",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    //color: meroonclr
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Card(
                  //   child: Column(
                  //     children: [Apptextwidget("${ctrl.currentuser.value}")],
                  //   ),
                  // )
                ],
              ),
            ),
          );
    });
  }
}