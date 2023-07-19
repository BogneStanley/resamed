import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// ignore: must_be_immutable
class RoundedIconButton extends StatelessWidget {
  Color? bgColor;
  double elevation;
  Color iconColor;
  Color? borderColor;
  double size;
  IconData iconData;
  double? borderSize;
  double iconSize;
  void Function()? onTap;
  bool loadingInProgress;

  RoundedIconButton({
    required this.iconData,
    required this.elevation,
    required this.size,
    required this.iconColor,
    this.borderColor,
    this.bgColor,
    required this.iconSize,
    this.loadingInProgress = false,
    this.onTap,
    this.borderSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: bgColor ?? Colors.transparent,
        elevation: elevation,
        shadowColor: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
              color: borderColor ?? bgColor ?? iconColor,
              width: borderSize ?? 3),
        ),
        child: InkWell(
          onTap: (onTap),
          highlightColor: Colors.transparent,
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
                child: (loadingInProgress)
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: iconColor, size: iconSize)
                    : Icon(iconData, color: iconColor, size: iconSize)),
          ),
        ));
  }
}
