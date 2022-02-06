import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_viewmodel.dart';

import 'home_appbar.dart';
import 'home_body.dart';
import 'home_drawer.dart';
import 'home_endDrawer.dart';

class HomeScreenLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(),
      appBar: HomeAppbar(),
      body: HomeBody(),
      endDrawer: HomeEndDrawer(),
    );
  }
}
