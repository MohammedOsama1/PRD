import 'package:flutter/material.dart';

class DefaultTTF extends StatelessWidget {
  const DefaultTTF(
      {Key? key,
      required this.controller,
      required this.label,
      this.suffixIcon,
      required this.prefixIcon,
      this.obscureText,
      required this.color})
      : super(key: key);
  final TextEditingController controller;

  final String label;

  final Widget prefixIcon;
  final Widget? suffixIcon;
  final Color color;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      style: TextStyle(color: color),
      validator: (val) {
        if (val!.isEmpty) {
          return 'It cannot be empty';
        }

        if ((label == "Neural" ||
                label == "Negative" ||
                label == "Postive" ||
                label == "price") &&
            !(int.tryParse(val!) != null)) {
          return 'Please enter a valid integer';
        }
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color),
              borderRadius: BorderRadius.circular(17)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: color),
              borderRadius: BorderRadius.circular(17)),

          label: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold, color: color),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
    );
  }
}
