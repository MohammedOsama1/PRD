import 'package:flutter/material.dart';

class DefaultTTF extends StatelessWidget {
  const DefaultTTF(
      {Key? key,
        required this.controller ,
        required this.label,
        this.suffixIcon,
        required this.prefixIcon,
        this.obscureText})
      : super(key: key);
  final TextEditingController controller;

  final String label;

  final Widget prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      validator: (val) {
        if (val!.isEmpty) {
          return 'It cannot be empty';
        }

        if ((label == "Neural" || label ==  "Negative" || label == "Postive"||label == "price") && !(int.tryParse(val!) != null)) {
          return 'Please enter a valid integer';
        }

      },
      decoration: InputDecoration(
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(17)
          )
          ,
          label: Text(label,style: TextStyle(fontWeight: FontWeight.bold),),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon),
    );
  }
}