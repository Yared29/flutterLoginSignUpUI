import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final name;
  final keyboardType;
  final obscureText;
  final hintText;
  final onChange;
  final showPassword;
  final obsecureSuffixIcon;
  final validator;
  final error;
  const CustomTextField(
      {Key? key,
      this.name,
      this.keyboardType,
      this.obscureText,
      this.hintText,
      this.onChange,
      this.obsecureSuffixIcon,
      this.showPassword,
      this.validator,
      this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 6.0),
          child: Text(
            name,
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.w400),
          ),
        ),
        Theme(
          data: ThemeData(primarySwatch: Colors.purple),
          child: TextFormField(
            onChanged: onChange,
            keyboardType: keyboardType,
            obscureText: obscureText ? !showPassword : obscureText,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                hintStyle: TextStyle(color: Colors.white30),
                fillColor: Color.fromRGBO(23, 23, 23, 1),
                suffixIcon: obscureText
                    ? obsecureSuffixIcon
                    : error == null
                        ? null
                        : error == true
                            ? null
                            : Container(
                                height: 28,
                                width: 28,
                                margin: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(33, 33, 33, 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white70,
                                  size: 18,
                                ),
                              ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(212, 40, 167, 1), width: 3))),
            validator: (val) => validator(val),
          ),
        ),
      ],
    );
  }
}
