

import '../all.dart';
import 'mytext_widgets.dart';

class CommonButton extends StatelessWidget {
  final String? title;
  final bool? isSmall;
  final bool? isBig;
  final double? width;
  final Color? color;
  final BoxBorder? border;
  final GestureTapCallback? onTap;
  final double? height;
  final double? radius;
  final Color? textColor;
  final String? textFamily;
  final double? textSize;

  const CommonButton({
    Key? key,
    required this.title,
    this.isSmall = true,
    this.isBig = false,
    this.width,
    required this.onTap,
    this.color,
    this.border,
    this.height,
    this.radius,
    this.textColor,
    this.textFamily,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.h),
        height: height ?? 57.px,
        width: isSmall!
            ? 150.px
            : isBig!
                ? 263.px
                : width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? appColors.buttonColor,
          borderRadius: BorderRadius.circular(radius ?? 15.px),
          border: border,
        ),
        child: MyTextView(
          title,
          textStyleNew: MyTextStyle(
            textLetterSpacing: 1,
            textSize: textSize ?? 16.px,
            textWeight: FontWeight.normal,
            textFamily: textFamily ?? fontFamilyBold,
            textColor: textColor ?? appColors.white,
          ),
        ),
      ),
    );
  }
}
