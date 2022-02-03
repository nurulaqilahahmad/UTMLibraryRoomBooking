import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_view_unlogged_in.dart';
import 'package:setup_mvvm/screens/login/login_view.dart';
import '../home/home_view_unlogged_in.dart';
import '../login/login_view.dart';
import '../view.dart';
import 'home_screen_logged_in.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => HomeView());

  @override
  Widget build(BuildContext context) {
    return View<HomeViewmodel>(
        builder: (_, vm, __) =>
            vm.user != null ? HomeScreenLoggedIn() : HomeViewUnloggedIn());
  }
}
