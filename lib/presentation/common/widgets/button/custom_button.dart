import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hospital/res/colors.dart';

class CButton extends HookConsumerWidget {
  const CButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.bgColor = AppColors.primary,
    this.labelColor = Colors.white,
    this.isLoading = false,
  });

  final String label;
  final void Function()? onPressed;
  final Color bgColor;
  final Color labelColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            minimumSize: const MaterialStatePropertyAll(
              Size.fromHeight(50),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            backgroundColor: MaterialStatePropertyAll(bgColor)),
        onPressed: onPressed,
        child: !isLoading
            ? Text(
                label,
                style: TextStyle(fontSize: 16, color: labelColor),
              )
            : SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: labelColor,
                ),
              ),
      ),
    );
  }
}
