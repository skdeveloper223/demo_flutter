import 'package:demo_flutter/screens/splashscreen/splash_controller.dart';

import '../../commons/all.dart';
import '../../commons/common_widgets/base_widgets.dart';
import '../../commons/common_widgets/mytext_widgets.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({Key? key}) : super(key: key);

  static const routes = "/";

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return BaseScreen(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              ImagePath.splashBack,
              fit: BoxFit.cover,
              scale: 0.5,
              // height: 100.h,
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            top: 25.h,
            child: Column(
              children: [
                Image.asset(
                  ImagePath.splashIcon,
                  width: 87.68.px,
                ),
                MyTextView(
                  Strings.appName,
                  textStyleNew: MyTextStyle(
                    textColor: appColors.textBlack,
                    textWeight: FontWeight.w900,
                    textSize: 50.px,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
