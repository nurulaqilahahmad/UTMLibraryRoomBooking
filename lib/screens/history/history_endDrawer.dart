// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../view.dart';
import '../profile/profile_view.dart';
import 'history_viewmodel.dart';

class HistoryEndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<HistoryViewmodel>(
      builder: (_, vm, __) => Drawer(
        child: Material(
          color: Colors.red[900],
          child: ListView(
            children: [
              const SizedBox(height: 10.0),
              buildMenu(
                text: 'Profile',
                icon: Icons.person,
                onClicked: () => Navigator.push(context, ProfileView.route()),
              ),
              // const SizedBox(height: 10.0),
              Divider(),
              // buildMenu(
              //   text: 'Reset Password',
              //   icon: Icons.lock,
              //   onClicked: () => Navigator.push(context, ResetPasswordView.route()),
              // ),
              // const SizedBox(height: 10.0),
              Divider(),
              buildMenu(
                  text: 'Log Out',
                  icon: Icons.logout,
                  onClicked: () => vm.signOut()),
              // const SizedBox(height: 10.0),
              Divider(),
              // ListTile(
              //   title: Text('Profile'),
              //   onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
              // ),
              // ListTile(
              //   title: Text('Reset Password'),
              //   onTap: () =>
              //       Navigator.pushReplacementNamed(context, '/resetpassword'),
              // ),
              // ListTile(
              //   title: Text('Log Out'),
              //   onTap: () => Navigator.push(context, LoginView.route()),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

ListTile buildMenu({String text, IconData icon, VoidCallback onClicked}) {
  final color = Colors.white;
  final hoverColor = Colors.white;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}
