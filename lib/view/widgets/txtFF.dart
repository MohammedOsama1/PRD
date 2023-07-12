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
        if (label == "Enter Your Email") {
          final pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$';
          final regExp = RegExp(pattern);

          if (val!.isEmpty) {
            return 'Email cannot be empty';
          } else if (!regExp.hasMatch(val)) {
            return 'Invalid email format';
          }
        }
        if (label == "Enter Your Password") {
          if (val!.isEmpty) {
            return 'Password cannot be empty';
          } else if (val.length < 6) {
            return 'Password must have at least 6 characters';
          }
        }

        if (val!.isEmpty) {
          return 'It cannot be empty';
        }
        if ((label == "Neural" ||
            label == "Negative" ||
            label == "Positive" ||
            label == "Enter Your Phone" ||
            label == "Price") &&
            !(int.tryParse(val) != null)) {
          return 'Please enter a valid integer';
        }

        return null;
      },
        keyboardType: label == "Enter Your Email"
            ? TextInputType.emailAddress
            : (label == "Neural" ||
            label == "Negative" ||
            label == "Positive" ||
            label == "Price")
            ? TextInputType.number
            : TextInputType.text,
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
