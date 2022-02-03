import 'package:flutter/material.dart';

import '../bookroom/bookroom_view.dart';
import '../history/history_view.dart';
import 'profile_viewmodel.dart';
import '../home/home_view.dart';
import '../view.dart';

class ProfileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return View<ProfileViewmodel>(
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
                text: 'Book A Room',
                icon: Icons.bookmark_add,
                onClicked: () => Navigator.push(context, BookRoomView.route()),
              ),
              // const SizedBox(height: 10.0),
              Divider(),
              buildMenu(
                text: 'History',
                icon: Icons.history,
                onClicked: () => Navigator.push(context, HistoryView.route()),
              ),
              // const SizedBox(height: 10.0),
              Divider(),
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
