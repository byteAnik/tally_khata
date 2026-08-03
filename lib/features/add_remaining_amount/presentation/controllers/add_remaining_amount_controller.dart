import 'package:get/get.dart';

class AddRemainingAmountController extends GetxController {
  RxBool isGivingDue = true.obs;

  void toggleTransactionType(bool value) {
    isGivingDue.value = value;
  }
}
