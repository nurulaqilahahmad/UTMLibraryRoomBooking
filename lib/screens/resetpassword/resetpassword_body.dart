// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class ResetPasswordBody extends StatefulWidget {
  const ResetPasswordBody({Key key}) : super(key: key);

  @override
  _ResetPasswordBodyState createState() => _ResetPasswordBodyState();
}

class _ResetPasswordBodyState extends State<ResetPasswordBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
          child: ListView(
            // itemBuilder: itemBuilder,
            // separatorBuilder: separatorBuilder,
            // itemCount: itemCount)(
            children: [
              Column(
                children: [
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _resetpassword("Email"),
                  _resetpassword("New Password"),
                  _resetpassword("Confirm Password"),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.transparent,
                      primary: Colors.red[900],
                    ),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/home'),
                    child: Text("RESET PASSWORD"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

Widget _resetpassword(String title) {
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
      ),
      SizedBox(
        height: 10.0,
      ),
    ],
  );
}
