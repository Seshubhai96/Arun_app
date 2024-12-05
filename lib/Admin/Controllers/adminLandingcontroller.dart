// ignore_for_file: prefer_final_fields

import 'package:arunmall/env/appexports.dart';

class Adminlandingcontroller extends ChangeNotifier {
  callresources(context) {
    final usrctrl = Provider.of<Userscontroller>(context, listen: false);
    Provider.of<Roomcontroller>(context, listen: false).fetchrooms();
    usrctrl.fetchUsers();
    usrctrl.fetchroleUsers();
  }
}
