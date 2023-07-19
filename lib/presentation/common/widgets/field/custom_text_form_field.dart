import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CTextFormField extends HookConsumerWidget {
  const CTextFormField({
    super.key,
    this.hintText,
    this.isPassword = false,
    this.minHeight = 50,
    this.prefixIcon,
  });
  final String? hintText;
  final bool isPassword;
  final double minHeight;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> isPasswordShow = useState(false);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        obscureText: isPassword ? !isPasswordShow.value : false,
        decoration: InputDecoration(
          constraints: BoxConstraints(minHeight: minHeight),
          hintText: hintText,
          filled: true,
          fillColor: Colors.blue.withOpacity(0.05),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          prefixIcon: prefixIcon,
          suffixIcon: isPassword
              ? GestureDetector(
                  child: Icon(!isPasswordShow.value
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onTap: () {
                    isPasswordShow.value = !isPasswordShow.value;
                  },
                )
              : null,
        ),
      ),
    );
  }
}
