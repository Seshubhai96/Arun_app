import 'package:arunmall/env/appexports.dart';
import 'dart:developer';

class Userscontroller extends ChangeNotifier {
  bool usersloaging = false;
  List<UsersModel> _userlist = [];
  List<UsersModel> get userslist => _userlist;
  fetchUsers() async {
    try {
      usersloaging = true;
      notifyListeners();
      final user = await Api().postmethod(endpoint: "auth/list");
      if (user["users"] != null) {
        List userslist = user["users"] ?? [];
        _userlist = userslist.map((e) => UsersModel.fromJson(e)).toList();
        notifyListeners();
        // log("user responce $user");
      }

      usersloaging = false;
      notifyListeners();
    } catch (e) {
      log("Get all users error $e");
      usersloaging = false;
      notifyListeners();
    }
  }

  var usergetbyid = false;
  UsersModel usersModel = UsersModel.fromJson({});
  getbyuserid({payload}) async {
    try {
      usergetbyid = true;
      notifyListeners();
      final user = await Api()
          .postmethod(endpoint: "auth/getbyid", body: {"id": payload});
      if (user != null) {
        //log(user.toString());
        usersModel = UsersModel.fromJson(user);
        notifyListeners();
      }
      usergetbyid = false;
      notifyListeners();
    } catch (e) {
      log("Error GetBYid $e");
      usergetbyid = false;
      notifyListeners();
    }
  }
}
