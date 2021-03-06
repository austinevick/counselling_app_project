import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final Function? onEditingComplete;
  final int maxLines;
  final Function(String)? onChanged;
  final Function(String)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? icon;
  final TextInputType? textInputType;
  final bool readOnly;
  final Function? onTap;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final Widget? prefixIcon;

  const TextInputField(
      {Key? key,
      this.onEditingComplete,
      this.prefixIcon,
      this.maxLines = 1,
      this.textInputType,
      this.textCapitalization = TextCapitalization.sentences,
      this.autofillHints,
      this.onChanged,
      this.onTap,
      this.validator,
      this.textInputAction,
      this.obscureText = false,
      this.readOnly = false,
      this.icon,
      this.controller,
      this.focusNode,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextFormField(
        autofillHints: autofillHints,
        onTap: onTap as void Function()?,
        readOnly: readOnly,
        textCapitalization: textCapitalization,
        keyboardType: textInputType,
        maxLines: maxLines,
        cursorColor: Colors.black,
        cursorWidth: 1,
        style: TextStyle(
          fontSize: 15,
        ),
        onEditingComplete: onEditingComplete as void Function()?,
        focusNode: focusNode,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff209f84)),
            ),
            disabledBorder: InputBorder.none,
            hintText: hintText,
            suffixIcon: icon),
        obscureText: obscureText,
        controller: controller,
        onChanged: onChanged,
        textInputAction: textInputAction,
        validator: validator as String? Function(String?)?,
      ),
    );
  }
}
