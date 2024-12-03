import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Roomcontroller extends ChangeNotifier {
  TextEditingController rnCtrl = TextEditingController();
  bool roomloading = false;
  List<Roommodel> _roomList = [];
  List<Roommodel> get roomList => _roomList;
  List<bool> toggleitems = [false, false];
  Roommodel roommodel = Roommodel.fromJson({});
  assignadata(data) {
    roommodel = Roommodel.fromJson(data);
    toggleData(roommodel.type == "Ac" ? 0 : 1);
    notifyListeners();
  }

  toggleData(isselectd) {
    if (isselectd != null) {
      if (isselectd == 0) {
        //log("AC");
        toggleitems = [true, false];
        roommodel.type = "Ac";
        notifyListeners();
      } else {
        // log("Non Ac");
        toggleitems = [false, true];
        roommodel.type = "Deluxe";
        notifyListeners();
      }
    } else {
      toggleitems = [false, false];
      roommodel.type = null;
      notifyListeners();
    }
  }

  cleardata() {
    roommodel = Roommodel.fromJson({});
    toggleData(null);
    notifyListeners();
  }

  bool iscreateorupdateloading = false;
  roomcreateorupdate(context, {endpoint}) async {
    try {
      iscreateorupdateloading = true;
      notifyListeners();
      final response = await Api().postmethod(
          body: roommodel.sId == null
              ? roommodel.createjson()
              : roommodel.toJson(),
          endpoint: endpoint);
      //log(response.toString());
      if (response != null) {
        Navigator.pop(context);
        fetchrooms();
        cleardata();
      }
      iscreateorupdateloading = false;
      notifyListeners();
    } catch (e) {
      iscreateorupdateloading = false;
      notifyListeners();
    }
  }

  fetchrooms() async {
    try {
      roomloading = true;
      notifyListeners();
      final room = await Api().postmethod(endpoint: "rooms/all");
      if (room != null) {
        //log("Rooms Response $room");
        List roomslist = room ?? [];
        _roomList = roomslist.map((y) => Roommodel.fromJson(y)).toList();
        notifyListeners();
      }
      roomloading = false;
      notifyListeners();
    } catch (e) {
      log("Getall Rooms Error $e");
      roomloading = false;
      notifyListeners();
    }
  }
}
