import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  // 設定一個整數私有變數 _count的欄位，初值為零
  int _count = 0;

  //可以透過 Consumer 來獲得當下 count 值
  int get count => _count;

  void loginState(bool item) {
    if (item == true) {
      _count = 1;
    } else
      _count = 0;
  }


  notifyListeners();
}
