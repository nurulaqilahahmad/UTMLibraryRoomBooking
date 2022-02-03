import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/widgets/registerLogin_appbar.dart';
import 'package:setup_mvvm/welcome.dart';
import '../login/login_view.dart';
import '../view.dart';
import '../login/login_viewmodel.dart';

class HomeViewUnloggedIn extends StatelessWidget {
  void _openLoginScreen(context) async {
    final result = await Navigator.push(context, LoginView.route());
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
            const SizedBox(height: 30),
            SizedBox(
              height: 30,
              child: View<LoginViewmodel>(
                builder: (_, vm, __) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    onSurface: Colors.transparent,
                    primary: Colors.red[900],
                  ),
                  child: Text('<   BACK'),
                  onPressed: () => _backToWelcome(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
