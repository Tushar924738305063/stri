import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stri/child/child_login_screen.dart';
import 'package:stri/utils/constants.dart';

import '../components/SecondaryButton.dart';
import '../components/custom_textfied.dart';
import '../components/primarybutton.dart';

class RegisterChildScreen extends StatefulWidget {
  @override
  State<RegisterChildScreen> createState() => _RegisterChildScreenState();
}

class _RegisterChildScreenState extends State<RegisterChildScreen> {
  // const RegisterChildScreen({super.key});
  bool isPasswordShown = true;

  final _formKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "REGISTER AS CHILD",
                      textAlign: TextAlign.center,
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
                height: MediaQuery.of(context).size.height * 0.75,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(
                        hintText: 'enter name',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.name,
                        prefix: Icon(Icons.person),
                        onsave: (name) {
                          _formData['name'] = name ?? " ";
                        },
                        validate: (name) {
                          if (name!.isEmpty || name.length < 3) {
                            return 'enter correct name';
                          }
                          return null;
                        },
                      ),
                      CustomTextField(
                        hintText: 'enter phone',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.phone,
                        prefix: Icon(Icons.phone_callback),
                        onsave: (phone) {
                          _formData['phone'] = phone ?? " ";
                        },
                        validate: (phone) {
                          if (phone!.isEmpty || phone.length < 10) {
                            return 'enter correct phone number';
                          }
                          return null;
                        },
                      ),
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
                        hintText: 'enter guardian_email',
                        textInputAction: TextInputAction.next,
                        keyboardtype: TextInputType.emailAddress,
                        prefix: Icon(Icons.person),
                        onsave: (gemail) {
                          _formData['gemail'] = gemail ?? " ";
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
                      CustomTextField(
                        hintText: 'enter  Retype Password',
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _onSubmit();
                            }
                          },
                          title: 'REGISTER'),
                    ],
                  ),
                ),
              ),

              // ElevatedButton(onPressed: () {}, child: Text("LogIn")),

              SecondaryButton(
                  title: 'Login with your account',
                  onPressed: () {
                    goTo(context, LoginScreen());
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
