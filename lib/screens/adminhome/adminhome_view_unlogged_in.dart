import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/widgets/registerLogin_appbar.dart';
import 'package:setup_mvvm/welcome.dart';
import '../adminlogin/adminlogin_view.dart';
import '../adminlogin/adminlogin_viewmodel.dart';
import '../view.dart';
import '../login/login_viewmodel.dart';

class AdminHomeViewUnloggedIn extends StatelessWidget {
  void _openLoginScreen(context) async {
    final result = await Navigator.push(context, AdminLoginView.route());
    if (result != null) {}
  }

  void _backToWelcome(context) async {
    final result = await Navigator.push(context, Welcome.route());
    if (result != null) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegisterLoginAppbar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/utm-library-logo.png')),
            const SizedBox(height: 30),
            Text(
              'Log In as Admin',
              style: TextStyle(fontSize: 26.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  child: View<AdminLoginViewmodel>(
                    builder: (_, vm, __) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onSurface: Colors.transparent,
                        primary: Colors.red[900],
                      ),
                      child: Text('<  BACK'),
                      onPressed: () => _backToWelcome(context),
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                SizedBox(
                  height: 30,
                  child: View<LoginViewmodel>(
                    builder: (_, vm, __) => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onSurface: Colors.transparent,
                        primary: Colors.red[900],
                      ),
                      child: Text('NEXT   >'),
                      onPressed: () => _openLoginScreen(context),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
