// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../home/home_view_unlogged_in.dart';
import '../view.dart';
import 'profile_screen.dart';
import 'profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => ProfileView());

  @override
  Widget build(BuildContext context) {
    return View<ProfileViewmodel>(
        builder: (_, vm, __) =>
            vm.user != null ? ProfileScreen() : HomeViewUnloggedIn());
  }
}
