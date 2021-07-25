import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final size;
  final text;
  final onPressed;
  final loading;
  const CustomButton(
      {Key? key, this.size, this.text, this.onPressed, this.loading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: RaisedButton(
        onPressed: loading ? null : onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(184, 23, 218, 1),
                  Color.fromRGBO(212, 40, 167, 1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: BoxConstraints(maxWidth: size.width, minHeight: 60.0),
            alignment: Alignment.center,
            child: loading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white70),
                  )
                : Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
          ),
        ),
      ),
    );
  }
}
