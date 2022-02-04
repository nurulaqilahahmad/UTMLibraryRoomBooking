// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'adminlogin_button.dart';
import '../view.dart';
import 'adminlogin_viewmodel.dart';
import 'adminlogin_view.dart';

class AdminLoginBody extends StatelessWidget {
  final AdminLoginViewState _state;

  AdminLoginBody(this._state);

  @override
  Widget build(BuildContext context) {
    return View<AdminLoginViewmodel>(
      builder: (context, viewmodel, _) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "Log In as Admin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                    ),
                  ),
                  const SizedBox(
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
                    height: 10.0,
                  ),
                  AdminLoginButton(viewmodel: viewmodel, state: _state),
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
