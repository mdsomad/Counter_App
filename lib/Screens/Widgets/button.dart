import 'dart:developer';

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function()? onPressed;
  final String? title;
  final Icon? icon;

  const Button({
    super.key,
    required this.onPressed,
    this.title,
    this.icon,
  }) : assert(title != null || icon != null,
            'Either title or icon must be provided');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 35,
      child: ElevatedButton(
        onPressed: onPressed,
        child: icon != null
            ? icon
            : FittedBox(
                child: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      ),
    );
  }
}
