import '../../commons/all.dart';
import '../../commons/common_widgets/base_widgets.dart';

class SplashController extends BaseController {
  startTime() async {
    // Timer(const Duration(seconds: 3), navigationPage);
  }

  /* void navigationPage() async {
    // utils.getAddressFromLatLng();

    if (getStorageData.containKey(getStorageData.loginData)) {
      LoginModel model = LoginModel.fromJson(
          getStorageData.readObject(getStorageData.loginData));
      if (model.responseCode == 1) {
        if (model.data!.userType == Constants.owner) {
          Constants.userOrOwner = true;
        }
        else{
          Constants.userOrOwner = false;
        }
        Get.offAndToNamed(BottomScreen.routes);
      } else {
        Get.offAllNamed(ChooseLanguageScreen.routes);
      }
    } else {
      Get.offAllNamed(ChooseLanguageScreen.routes);
    }
    // Get.offAll(TrafficLightDemo());
  }*/

  @override
  void onInit() {
    startTime();
    selectedLang = Constants.languageCodeEn;

    printAction("konsa bhasha hai =-=- $selectedLang");
    super.onInit();
  }
}
