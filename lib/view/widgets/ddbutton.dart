import 'package:flutter/material.dart';


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
          color: Colors.amber,
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}