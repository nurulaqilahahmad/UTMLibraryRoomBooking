import 'package:flutter/material.dart';
import '../view.dart';
import 'adminhome_view_logged_in.dart';
import 'adminhome_view_unlogged_in.dart';
import 'adminhome_viewmodel.dart';

class AdminHomeView extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => AdminHomeView());

  @override
  Widget build(BuildContext context) {
    return View<AdminHomeViewmodel>(
        builder: (_, vm, __) => vm.user != null
            ? AdminHomeViewLoggedIn()
            : AdminHomeViewUnloggedIn());
  }
}
