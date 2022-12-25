import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:movie_app/core/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _formState = GlobalKey();

  bool isLoginState = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 8,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Form(
                key: _formState,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    Text(
                      isLoginState ? "Welcome Back !" : "Create New Account",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    TextFormField(
                        cursorColor: Colors.grey,
                        autofocus: false,
                        controller: _emailController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 12.0,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            hintText: 'Email',
                            fillColor:
                                const Color.fromARGB(255, 228, 228, 228)),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          EmailValidator(errorText: "Enter valid email id"),
                        ])),
                    const SizedBox(width: 0.0, height: 8),
                    TextFormField(
                        cursorColor: Colors.grey,
                        autofocus: false,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 12.0,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            hintText: 'Password',
                            fillColor:
                                const Color.fromARGB(255, 228, 228, 228)),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "* Required"),
                          MinLengthValidator(6,
                              errorText:
                                  "Password should be atleast 6 characters"),
                          MaxLengthValidator(15,
                              errorText:
                                  "Password should not be greater than 15 characters")
                        ])),
                    const SizedBox(width: 0.0, height: 80),
                    GestureDetector(
                      onTap: () {
                        if (_formState.currentState!.validate()) {
                          if (isLoginState) {
                            AuthServices.signInFirebase(
                                this.context,
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                          } else {
                            AuthServices.registerFirebase(
                                this.context,
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 8.0,
                        ),
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            isLoginState ? "Sign In" : "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 0.0, height: 20),
                    GestureDetector(
                      onTap: () {
                        if (_formState.currentState!.validate()) {
                          if (isLoginState) {
                            AuthServices.signInFirebase(
                                this.context,
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                          } else {
                            AuthServices.registerFirebase(
                                this.context,
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                          }
                        }
                      },
                      child: Icon(Icons.account_box, size: ,),
                    ),
                    const SizedBox(width: 0.0, height: 20),
                    RichText(
                        text: TextSpan(
                            text: isLoginState
                                ? "Doesn't have account?     "
                                : "Already have account?     ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  isLoginState = !isLoginState;
                                });
                              },
                            text: isLoginState ? "Sign Up" : "Sign In",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          )
                        ]))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
