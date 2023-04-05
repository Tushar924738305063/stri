import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stri/components/custom_textfied.dart';
import 'package:stri/components/secondarybutton.dart';
import 'package:stri/main.dart';
import 'package:stri/child/register_child.dart';
import 'package:stri/parent/parent_register_screen.dart';
import 'package:stri/utils/constants.dart';

import '../components/primarybutton.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({super.key});
  bool isPasswordShown = true;
  final _formKey = GlobalKey<FormState>();

  // without using text editing controller form banate hai

  final _formData = Map<String, Object>();
  _onSubmit() {
    _formKey.currentState!.save();
    print(_formData['email']);
    print(_formData['password']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Stri",
                        style: TextStyle(
                            fontSize: 40,
                            color: Color(0xfffc3b77),
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset(
                        'assets/logo.png',
                        height: 100,
                        width: 100,
                      ),
                    ],
                  ),
                ),

                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextField(
                          hintText: 'enter email',
                          textInputAction: TextInputAction.next,
                          keyboardtype: TextInputType.emailAddress,
                          prefix: Icon(Icons.person),
                          onsave: (email) {
                            _formData['email'] = email ?? " ";
                          },
                          validate: (email) {
                            if (email!.isEmpty ||
                                email.length < 3 ||
                                email.contains("@")) {
                              return 'enter correct email';
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          hintText: 'enter  password',
                          isPassword: isPasswordShown,
                          prefix: Icon(Icons.vpn_key_rounded),
                          onsave: (password) {
                            _formData['password'] = password ?? " ";
                          },
                          validate: (password) {
                            if (password!.isEmpty || password.length < 7) {
                              return ' have entered short password ';
                            }
                            return null;
                          },
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPasswordShown = !isPasswordShown;
                                });
                              },
                              icon: isPasswordShown
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                        ),
                        PrimaryButton(
                          title: 'LOGIN',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _onSubmit();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // ElevatedButton(onPressed: () {}, child: Text("LogIn")),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 18),
                      ),
                      SecondaryButton(title: 'Click', onPressed: () {}),
                    ],
                  ),
                ),
                SecondaryButton(
                    title: 'Register as chld',
                    onPressed: () {
                      goTo(context, RegisterChildScreen());
                    }),

                SecondaryButton(
                    title: 'Register as parent',
                    onPressed: () {
                      goTo(context, RegisterParentScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
