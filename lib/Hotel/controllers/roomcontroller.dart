import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Roomcontroller extends ChangeNotifier {
  TextEditingController rnCtrl = TextEditingController();
  bool roomloading = false;
  List<Roommodel> _roomList = [];
  List<Roommodel> get roomList => _roomList;
  List<bool> toggleitems = [false, false];
  toggleData(isselectd) {
    if (isselectd != null) {
      if (isselectd == 0) {
        //log("AC");
        toggleitems = [true, false];
        notifyListeners();
      } else {
        // log("Non Ac");
        toggleitems = [false, true];
        notifyListeners();
      }
    } else {
      toggleitems = [false, false];
      notifyListeners();
    }
  }

  bool iscreateorupdateloading = false;
  roomcreateorupdate({body, endpoint}) async {
    try {
      iscreateorupdateloading = true;
      notifyListeners();
      final response = await Api().postmethod(body: body, endpoint: endpoint);
      if (response != null) {
        log(response.toString());
      }
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
