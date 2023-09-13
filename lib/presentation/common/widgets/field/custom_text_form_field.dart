import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CTextFormField extends HookConsumerWidget {
  const CTextFormField({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.enabledInput = true,
    this.minHeight = 50,
    this.prefixIcon,
    this.surfixIcon,
    this.controller,
    this.validator,
    this.readOnly = false,
    this.onTap,
  });
  final String? hintText;
  final bool readOnly;
  final void Function()? onTap;
  final bool isPassword;
  final bool enabledInput;
  final double minHeight;
  final Widget? prefixIcon;
  final Widget? surfixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> isPasswordShow = useState(false);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        readOnly: readOnly,
        onTap: onTap,
        obscureText: isPassword ? !isPasswordShow.value : false,
        enabled: enabledInput,
        controller: controller,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          color: const Color.fromARGB(255, 49, 49, 49),
        ),
        decoration: InputDecoration(
          constraints: BoxConstraints(minHeight: minHeight),
          hintText: hintText,
          filled: true,
          fillColor: Colors.blue.withOpacity(0.05),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          prefixIcon: prefixIcon,
          suffixIcon: surfixIcon ??
              (isPassword
                  ? GestureDetector(
                      child: Icon(!isPasswordShow.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onTap: () {
                        isPasswordShow.value = !isPasswordShow.value;
                      },
                    )
                  : null),
        ),
      ),
    );
  }

  //function that return a widget that fill a textformfield with a date using a gesture detector for picking a date
  static Widget date(BuildContext context,
      {required TextEditingController controller,
      required String hintText,
      bool withTime = false,
      String? Function(String?)? validator}) {
    return GestureDetector(
      onTap: () async {
        var result = await showDatePicker(
          context: context,
          initialDate: DateTime(2010),
          firstDate: DateTime(1850),
          lastDate: DateTime.now(),
        );
        if (result == null) {
          return;
        }
        if (!withTime) {
          controller.text = result.toString().split(" ")[0];
          return;
        }
        var result2 = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (result2 == null) {
          return;
        }
        controller.text =
            result.toString().split(" ")[0] + " " + result2.format(context);
      },
      child: CTextFormField(
        hintText: hintText,
        controller: controller,
        enabledInput: false,
        validator: validator,
        surfixIcon: const Icon(
          Icons.calendar_month,
          color: Colors.black,
        ),
      ),
    );
  }
}
