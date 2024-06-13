import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  int selectedBottomNavBar = 0;
  void onBottomNavigationTabChange(int index) {
    selectedBottomNavBar = index;
    notifyListeners();
  }

  bool isRightDoorLock = true;
  bool isLeftDoorLock = true;
  bool isBottomtDoorLock = true;
  bool isTopDoorLock = true;

  // ignore: non_constant_identifier_names
  void UpdateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void UpdateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void UpdateBottomtDoorLock() {
    isBottomtDoorLock = !isBottomtDoorLock;
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void UpdateTopDoorLock() {
    isTopDoorLock = !isTopDoorLock;
    notifyListeners();
  }

  bool isCoolSelected = true;
  void updateTempSelecteTab() {
    isCoolSelected = !isCoolSelected;
    notifyListeners();
  }

  double TempRange = 15;
  void setTempUp() {
    TempRange++;
    notifyListeners();
  }

  void SetTempdown() {
    TempRange--;
    notifyListeners();
  }

  bool isshowCarIcon = true;
  void showCar(int index) {
    if (selectedBottomNavBar < 3) {
      isShowTyre = true;
      notifyListeners();
    } else
      isshowCarIcon = false;
    notifyListeners();
  }

  bool isShowTyre = false;
  void ShowTyreIcon(int index) {
    if (selectedBottomNavBar != 3 && index == 3) {
      Future.delayed(Duration(milliseconds: 400), () {
        isShowTyre = true;
        notifyListeners();
      });
    } else {
      isShowTyre = false;
      notifyListeners();
    }
  }

  bool isTyreShowStatus = false;
  void tyreStatusController(int index) {
    if (selectedBottomNavBar != 3 && index == 3) {
      isTyreShowStatus = true;
      notifyListeners();
    } else {
      Future.delayed(Duration(milliseconds: 400), () {
        isTyreShowStatus = false;
        notifyListeners();
      });
    }
  }

  bool isLocationStatus = false;
  void GPSStatusController(int index) {
    if (selectedBottomNavBar != 4 && index == 4) {
      isLocationStatus = true;
      notifyListeners();
    } else {
      Future.delayed(Duration(milliseconds: 300), () {
        isLocationStatus = false;
        notifyListeners();
      });
    }
  }
}
