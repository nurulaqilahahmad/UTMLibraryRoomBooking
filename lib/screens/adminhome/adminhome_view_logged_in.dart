import 'package:flutter/material.dart';

import 'adminhome_appbar.dart';
import 'adminhome_body.dart';
import 'adminhome_drawer.dart';

class AdminHomeViewLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminHomeAppbar(),
      body: AdminHomeBody(),
      endDrawer: AdminHomeDrawer(),
    );
  }
}
