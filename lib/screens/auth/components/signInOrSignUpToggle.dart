import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInOrSignUpToggle extends StatelessWidget {
  final text;
  final textButton;
  final changeToggle;
  const SignInOrSignUpToggle(
      {Key? key, this.text, this.textButton, this.changeToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: RichText(
      text: TextSpan(
          text: text,
          style: TextStyle(color: Colors.white60),
          children: [
            TextSpan(
              text: textButton,
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.w700),
              recognizer: TapGestureRecognizer()..onTap = changeToggle,
            ),
          ]),
    ));
  }
}
