import 'package:flutter/services.dart';

import '../all.dart';
import 'mytext_widgets.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Color? cursorColor;
  final TextInputType? inputType;
  final bool? enabled;
  final bool? obscureText;
  final bool? isMaxLines;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onTap;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? minLines;
  final List<TextInputFormatter>? inputFormat;
  final TextStyle? textStyle;
  final FontWeight? textWeight;
  final double? textSize;
  final Color? textColor;
  final String? hintText;
  final FontWeight? hintTextWeight;
  final TextStyle? hintTextStyle;
  final double? hintTextSize;
  final Color? hintColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxBorder? border;
  final Color? color;
  final double? height;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final String? textFamily;
  final Color? shadowColor;
  final bool readOnly;

  const CommonTextField({
    Key? key,
    required this.controller,
    this.cursorColor,
    this.inputType,
    this.enabled = true,
    this.obscureText = false,
    this.isMaxLines = false,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.maxLength,
    this.minLines,
    this.inputFormat,
    this.textStyle,
    this.textWeight,
    this.textSize,
    this.textColor,
    this.hintText,
    this.hintTextWeight,
    this.hintTextStyle,
    this.hintTextSize,
    this.hintColor,
    this.suffixIcon,
    this.prefixIcon,
    this.border,
    this.color,
    this.height,
    this.alignment,
    this.padding,
    this.textFamily,
    this.readOnly = false,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppColors appColors = AppColors();
    return Container(
      height: height ?? 57.px,
      alignment: alignment ?? Alignment.center,
      decoration: BoxDecoration(
        color: color ?? AppColors().white,
        borderRadius: BorderRadius.circular(15.px),
        border: border ??
            Border.all(
              color: appColors.grey.withOpacity(0.1),
            ),
        boxShadow: [
          BoxShadow(
            color: shadowColor ?? AppColors().shedow.withOpacity(0.1),
            offset: const Offset(
              10.0,
              10.0,
            ),
            blurRadius: 5.h,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
      ),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 1.5.h),
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        cursorColor: cursorColor ?? appColors.grey,
        cursorHeight: 15.px,
        keyboardType: inputType,
        enabled: enabled,
        obscureText: obscureText!,
        maxLines: isMaxLines! ? null : maxLines,
        textInputAction: textInputAction,
        onSubmitted: onSubmit,
        onChanged: onChange,
        onTap: onTap,
        textAlign: textAlign!,
        autocorrect: false,
        autofocus: false,
        focusNode: focusNode,
        maxLength: maxLength,
        minLines: minLines,
        inputFormatters: inputFormat,
        textAlignVertical: TextAlignVertical.center,
        style: textStyle ??
            MyTextStyle(
              textWeight: textWeight ?? FontWeight.w400,
              textSize: textSize ?? 15.px,
              textColor: textColor ?? appColors.black,
            ),
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintText: hintText,
          counter: null,
          counterText: "",
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: hintTextStyle ??
              MyTextStyle(
                textColor: hintColor ?? appColors.lightText.withOpacity(0.5),
                textWeight: hintTextWeight ?? FontWeight.normal,
                textSize: textSize ?? 15.px,
                textFamily: fontFamilyRegular,
              ),
        ),
      ),
    );
  }
}
