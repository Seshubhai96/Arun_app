// ignore_for_file: invalid_use_of_protected_member

import 'package:arunmall/env/appexports.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ctrl = Get.find<Logincontroller>();
  @override
  Widget build(BuildContext context) {
    return Obx(()=> ctrl.usergetbyid.value?const Loader():SafeArea(
      child: SizedBox(height: Get.height,width: Get.width,child: Column(
        children: [
          Card(
            child: Column(
              children: [
                Apptextwidget("${ctrl.currentuser.value}")
              ],
            ),
          )
        ],
      ),),
    ));
  }
}