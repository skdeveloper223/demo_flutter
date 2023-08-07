import '../all.dart';

class BackImage extends StatelessWidget {
  final String? image;
  final Widget? child;

  const BackImage({
    Key? key,
    this.image,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors().white,
        image: DecorationImage(
            image: AssetImage(
              image!,
            ),
            fit: BoxFit.fill),
      ),
      child: child,
    );
  }
}
