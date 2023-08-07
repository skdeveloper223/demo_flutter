import 'package:adres/screens/add_bank_detail/add_bank_detail_controller.dart';
import 'package:get/get.dart';

class AddBankDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AddBankDetailController>(AddBankDetailController());
  }
}
