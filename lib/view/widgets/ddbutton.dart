import 'package:flutter/material.dart';
import 'package:prd/view/theme.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.onTap, required this.label})
      : super(key: key);
  final void Function() onTap;

  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          color: KColor,
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(
              label,
              style:  TextStyle(color: AllWhite,fontSize: 22),
            ),
          ),
        ));
  }
}