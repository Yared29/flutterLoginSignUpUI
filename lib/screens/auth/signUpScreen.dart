import 'package:flutter/material.dart';
import 'package:flutterloginsignupui/screens/auth/components/customButton.dart';
import 'package:flutterloginsignupui/screens/auth/components/customTextField.dart';
import 'package:flutterloginsignupui/screens/auth/components/signInOrSignUpToggle.dart';
import 'package:flutterloginsignupui/screens/auth/components/socialLogInIcon.dart';

class SignUpScreen extends StatefulWidget {
  final changeToggle;
  SignUpScreen({Key? key, this.changeToggle}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool showPassword = false;
  String? _name;
  bool? _nameError;
  String? _email;
  bool? _emailError;
  String? _password;
  bool? _passwordError;
  bool loading = false;
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  final _formKey = GlobalKey<FormState>();

  _validateName(String value) {
    value.trim();
    if (value == null || value.isEmpty) {
      setState(() {
        _nameError = true;
      });
      return 'Please enter your name';
    } else if (double.tryParse(value) != null) {
      setState(() {
        _nameError = true;
      });
      return 'Only text are allowed';
    } else {
      setState(() {
        _nameError = false;
      });
      return null;
    }
  }

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    onSubmitForm() async {
      if (_formKey.currentState!.validate()) {
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: AppBar(
              title: Text(
                'Sign Up',
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
                    foregroundColor: MaterialStateProperty.all(Colors.white70),
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(10, 10, 10, 1),
                    ),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Color(0xFF1F1F1F), width: 2)))),
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                child: Text(
                  'Sign up with one of the following options.',
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
                        icon: 'assets/icons/facebookIcon.svg', onPressed: () {})
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 25.0),
                child: CustomTextField(
                    name: 'Name',
                    onChange: (val) {
                      setState(() {
                        _name = val;
                      });
                      _name!.trim();
                      if (_validateName(val) == null) {
                        setState(() {
                          _nameError = false;
                        });
                      } else {
                        setState(() {
                          _nameError = true;
                        });
                      }
                    },
                    obscureText: false,
                    hintText: 'John Doe',
                    keyboardType: TextInputType.text,
                    validator: _validateName,
                    error: _nameError),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 25.0),
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
                                Icons.visibility_outlined,
                                color: Colors.white60,
                              )
                            : Icon(Icons.visibility_off,
                                color: Colors.white60)),
                    hintText: 'Pick a strong password',
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    validator: _validatePassword,
                    error: _passwordError),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CustomButton(
                  size: size,
                  loading: loading,
                  text: 'Create Account',
                  onPressed: onSubmitForm,
                ),
              ),
              SignInOrSignUpToggle(
                  text: 'Already have an account? ',
                  textButton: 'Log in',
                  changeToggle: widget.changeToggle)
            ]),
          ),
        ),
      ),
    );
  }
}
