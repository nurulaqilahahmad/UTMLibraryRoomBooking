import 'package:flutter/material.dart';
import 'profile_drawer.dart';
import 'profile_appbar.dart';
import 'profile_body.dart';
import 'profile_endDrawer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      appBar: ProfileAppbar(),
      body: ProfileBody(),
      endDrawer: ProfileEndDrawer(),
    );
  }
}
