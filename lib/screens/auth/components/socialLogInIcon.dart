import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLogInIcon extends StatelessWidget {
  final icon;
  final onPressed;
  const SocialLogInIcon({Key? key, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: SvgPicture.asset(
        icon,
        width: 28,
        height: 28,
        color: Colors.white70,
      ),
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(Size(170, 60)),
          foregroundColor: MaterialStateProperty.all(Colors.white70),
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(10, 10, 10, 1),
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Color(0xFF1F1F1F), width: 2)))),
    );
  }
}
