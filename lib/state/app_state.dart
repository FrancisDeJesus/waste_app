import 'package:flutter/material.dart';

enum WasteType { customer, kitchen, service }

class AppState extends ChangeNotifier {
  String? name, restaurant, address;
  WasteType? selectedWaste;
  bool hasRecyclables = false;
  DateTime? scheduledAt;
  int points = 20; // demo starting points

  void register({required String n, required String r, required String a}) {
    name = n; restaurant = r; address = a;
    notifyListeners();
  }

  void setWaste(WasteType t, bool recyclables) {
    selectedWaste = t; hasRecyclables = recyclables;
    notifyListeners();
  }

  void setSchedule(DateTime when) {
    scheduledAt = when;
    // award demo points para makita sa presentation
    points += 5;
    notifyListeners();
  }

  void redeem(int cost) {
    if (points >= cost) { points -= cost; notifyListeners(); }
  }

  void logout() {
  name = null;
  points = 0;
  notifyListeners();
  }
}
