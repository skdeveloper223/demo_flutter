import '../all.dart';

class ShadowContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final bool? isBorder;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const ShadowContainer({
    Key? key,
    this.height,
    required this.child,
    this.width,
    this.margin,
    this.isBorder = true,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 147.px,
      width: width,
      alignment: Alignment.center,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.px),
        border: isBorder!
            ? Border.all(
                color: AppColors().grey.withOpacity(0.1),
                width: 0.5.w,
              )
            : Border.all(color: Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: AppColors().shedow.withOpacity(0.1),
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 50.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 1.5.h),
      child: child,
    );
  }
}
