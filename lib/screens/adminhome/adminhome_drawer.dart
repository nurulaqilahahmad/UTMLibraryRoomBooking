import 'package:flutter/material.dart';

import '../adminprofile/adminprofile_view.dart';
import '../approvebooking/approvebooking_view.dart';
import 'adminhome_viewmodel.dart';
import '../home/home_view.dart';
import '../view.dart';

class AdminHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<AdminHomeViewmodel>(
      builder: (_, vm, __) => Drawer(
        child: Material(
          color: Colors.red[900],
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              const SizedBox(height: 10.0),
              buildMenu(
                text: 'Home',
                icon: Icons.home,
                onClicked: () => Navigator.push(context, HomeView.route()),
              ),
              // const SizedBox(height: 10.0),
              Divider(),
              buildMenu(
                text: 'Approve Booking',
                icon: Icons.check,
                onClicked: () =>
                    Navigator.push(context, ApproveBookingView.route()),
              ),
              // const SizedBox(height: 10.0),
              Divider(),
              buildMenu(
                text: 'Profile',
                icon: Icons.person,
                onClicked: () =>
                    Navigator.push(context, AdminProfileView.route()),
              ),
              // const SizedBox(height: 10.0),
              Divider(),
              buildMenu(
                text: 'Log Out',
                icon: Icons.logout,
                onClicked: () => vm.signOut(),
              ),
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
