import 'package:flutter/material.dart';
import 'package:jotit_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, this.maxLines = 1});
  final String hint;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: buildBolder(),
          enabledBorder: buildBolder(),
          focusedBorder: buildBolder(kPrimaryColor),
          hintText: hint,
          hintStyle: const TextStyle(
            color: kPrimaryColor,
          )),
    );
  }
}

OutlineInputBorder buildBolder([color]) {
  return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ));
}
