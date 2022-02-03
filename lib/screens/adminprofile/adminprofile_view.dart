import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/adminhome/adminhome_view_unlogged_in.dart';
import '../view.dart';
import 'adminprofile_screen.dart';
import 'adminprofile_viewmodel.dart';

class AdminProfileView extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => AdminProfileView());

  @override
  Widget build(BuildContext context) {
    return View<AdminProfileViewmodel>(
        builder: (_, vm, __) =>
            vm.user != null ? AdminProfileScreen() : AdminHomeViewUnloggedIn());
  }
}
