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

  bool usersroleloading = false;
  List<UserroleModel> _userrolelist = [];
  List<UserroleModel> get userrolelist => _userrolelist;
  fetchroleUsers() async {
    try {
      usersroleloading = true;
      notifyListeners();
      final usersrole = await Api().postmethod(endpoint: "role/rolelists");
      if (usersrole != null) {
        List userrolelist = usersrole ?? [];
        _userrolelist =
            userrolelist.map((e) => UserroleModel.fromJson(e)).toList();
        notifyListeners();
        log("Usersrole Responce $usersrole ");
      }
      usersroleloading = false;
      notifyListeners();
    } catch (e) {
      log("Get all users error $e");
      usersroleloading = false;
      notifyListeners();
    }
  }

  changegender(val) {
    usersModel.gender = val;
    notifyListeners();
    //log(usersModel.toJson().toString());
  }

  changerole(val) {
    usersModel.role = val;
    notifyListeners();
  }

  changetype(val) {
    usersModel.type = val;
    notifyListeners();
  }

  var usergetbyid = false;
  UsersModel usersModel = UsersModel.fromJson({});
  getbyuserid({payload}) async {
    try {
      usersModel = UsersModel.fromJson({});
      usergetbyid = true;
      notifyListeners();
      final user = await Api()
          .postmethod(endpoint: "auth/getbyid", body: {"id": payload});
      if (user != null) {
        log(user.toString());
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
