// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'login_button.dart';
import '../view.dart';
import 'login_viewmodel.dart';
import 'login_view.dart';

class LoginBody extends StatelessWidget {
  final LoginViewState _state;

  LoginBody(this._state);

  @override
  Widget build(BuildContext context) {
    return View<LoginViewmodel>(
      builder: (context, viewmodel, _) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          child: ListView(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Log In as Student",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _login("Email", false, _state.emailController),
                  _login("Password", true, _state.passwordController),
                  if (viewmodel.errorMessage != null)
                    Text(
                      viewmodel.errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  LoginButton(viewmodel: viewmodel, state: _state),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _login(String title, bool isObsecure, TextEditingController state) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          height: 3.0,
        ),
      ),
      TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: "Enter $title",
        ),
        obscureText: isObsecure,
        controller: state,
      ),
      SizedBox(
        height: 10.0,
      ),
    ],
  );
}
