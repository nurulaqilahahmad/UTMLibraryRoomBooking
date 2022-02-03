// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../view.dart';
import 'adminhome_viewmodel.dart';

class AdminHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return View<AdminHomeViewmodel>(
      builder: (context, vm, _) => AppBar(
        elevation: 0.0,
        title: Text('UTM Library'),
        actions: [
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer()),
        ],
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
