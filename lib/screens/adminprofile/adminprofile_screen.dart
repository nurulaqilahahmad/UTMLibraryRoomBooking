import 'package:flutter/material.dart';

import 'adminprofile_appbar.dart';
import 'adminprofile_body.dart';
import 'adminprofile_drawer.dart';

class AdminProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminProfileAppbar(),
      body: AdminProfileBody(),
      endDrawer: AdminProfileDrawer(),
    );
  }
}
