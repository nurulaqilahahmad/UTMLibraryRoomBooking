// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../view.dart';
import 'updatebooking_viewmodel.dart';

class UpdateBookingAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return View<UpdateBookingViewmodel>(
      builder: (context, vm, _) => AppBar(
        elevation: 0.0,
        title: Text('UTM Library'),
        actions: [
          IconButton(
              icon: Icon(Icons.person),
              onPressed: () => Scaffold.of(context).openEndDrawer()),
        ],
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
