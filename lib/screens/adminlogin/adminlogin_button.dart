import 'package:flutter/material.dart';
import 'adminlogin_view.dart';
import 'adminlogin_viewmodel.dart';

class AdminLoginButton extends StatelessWidget {
  final AdminLoginViewmodel viewmodel;
  final AdminLoginViewState state;
  const AdminLoginButton({this.viewmodel, this.state});

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
