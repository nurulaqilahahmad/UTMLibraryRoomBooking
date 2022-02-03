import 'package:flutter/material.dart';
import 'login_view.dart';
import 'login_viewmodel.dart';

class LoginButton extends StatelessWidget {
  final LoginViewmodel viewmodel;
  final LoginViewState state;
  const LoginButton({this.viewmodel, this.state});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onSurface: Colors.transparent,
            primary: Colors.red[900],
          ),
          child: Text('LOG IN'),
          onPressed: () => state.onLogin(viewmodel),
        ),
        const SizedBox(width: 10.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onSurface: Colors.transparent,
            primary: Colors.red[900],
          ),
          child: Text('CANCEL'),
          onPressed: state.onCancel,
        ),
        const SizedBox(width: 10.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onSurface: Colors.transparent,
            primary: Colors.red[900],
          ),
          child: Text('CLEAR'),
          onPressed: () => state.onClear(viewmodel),
        ),
      ],
    );
  }
}
