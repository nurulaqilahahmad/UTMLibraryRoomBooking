// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:setup_mvvm/welcome.dart';
import '../view.dart';
import '../profile/profile_view.dart';
import 'home_viewmodel.dart';

class HomeEndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<HomeViewmodel>(
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
              Divider(),
              buildMenu(
                text: 'Log Out',
                icon: Icons.logout,
                onClicked: () => vm.signOut(),
              ),
              Divider(),
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
