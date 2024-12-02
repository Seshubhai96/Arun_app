// ignore_for_file: prefer_final_fields

import 'dart:developer';

import 'package:arunmall/env/appexports.dart';

class Adminlandingcontroller extends ChangeNotifier {
  bool roomloading = false;
  List<Roommodel> _roomList = [];
  List<Roommodel> get roomList => _roomList;
  fetchrooms() async {
    try {
      roomloading = true;
      notifyListeners();
      final room = await Api().postmethod(endpoint: "rooms/all");
      if (room != null) {
        log("Rooms Response $room");
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

  callresources() {
    fetchrooms();
  }
}
