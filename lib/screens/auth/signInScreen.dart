import 'package:flutterloginsignupui/screens/auth/components/customButton.dart';
import 'package:flutterloginsignupui/screens/auth/components/customTextField.dart';
import 'package:flutterloginsignupui/screens/auth/components/signInOrSignUpToggle.dart';
import 'package:flutterloginsignupui/screens/auth/components/socialLogInIcon.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  final changeToggle;
  SignInScreen({Key? key, this.changeToggle}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool showPassword = false;
  String? _email;
  bool? _emailError;
  String? _password;
  bool? _passwordError;
  bool loading = false;
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _validatePassword(String value) {
      if (value.length < 6)
        return 'Password must greater than 6';
      else
        return null;
    }

    _validateEmail(String value) {
      value.trim();
      String pattern =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value)) {
        print(!regex.hasMatch(value));
        return 'Enter Valid Email';
      } else
        return null;
    }

    onSubmitForm() async {
      if (_formKey.currentState!.validate()) {}
    }

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: AppBar(
                title: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                leading: ElevatedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white70,
                  ),
                  style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(50, 50)),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.white70),
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(10, 10, 10, 1),
                      ),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:
                              BorderSide(color: Color(0xFF1F1F1F), width: 2)))),
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                      child: Text(
                        'Log in with one of the following option.',
                        style: TextStyle(color: Colors.white54, fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialLogInIcon(
                            icon: 'assets/icons/googleIcon.svg',
                            onPressed: () {},
                          ),
                          SocialLogInIcon(
                            icon: 'assets/icons/facebookIcon.svg',
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
                      child: CustomTextField(
                          name: 'Email',
                          onChange: (val) {
                            setState(() {
                              _email = val;
                            });
                            _email!.trim();

                            if (_validateEmail(val) == null) {
                              setState(() {
                                _emailError = false;
                              });
                            } else {
                              setState(() {
                                _emailError = true;
                              });
                            }
                          },
                          obscureText: false,
                          hintText: 'John@gmail.com',
                          keyboardType: TextInputType.text,
                          validator: _validateEmail,
                          error: _emailError),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, bottom: 35.0),
                      child: CustomTextField(
                          name: 'Password',
                          showPassword: showPassword,
                          onChange: (val) {
                            setState(() {
                              _password = val;
                            });
                          },
                          obsecureSuffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: showPassword
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Colors.white60,
                                    )
                                  : Icon(Icons.visibility_outlined,
                                      color: Colors.white60)),
                          hintText: 'Enter your password',
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          validator: _validatePassword,
                          error: _passwordError),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: CustomButton(
                        size: size,
                        text: 'Log in',
                        loading: loading,
                        onPressed: onSubmitForm,
                      ),
                    ),
                    SignInOrSignUpToggle(
                        text: 'Don\'t have an account? ',
                        textButton: 'Sign Up',
                        changeToggle: widget.changeToggle)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
