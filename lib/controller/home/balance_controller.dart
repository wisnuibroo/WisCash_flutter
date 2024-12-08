import 'package:get/get.dart';

class BalanceController extends GetxController {

  var balance = 0.obs; 

  void addBalance(int amount) {
    balance.value += amount;
  }

  void setBalance(int newBalance) {
    balance.value = newBalance;
  }
}
