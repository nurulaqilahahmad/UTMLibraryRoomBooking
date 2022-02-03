import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/home/home_view_unlogged_in.dart';
import 'package:setup_mvvm/screens/login/login_view.dart';
import '../home/home_view_unlogged_in.dart';
import '../view.dart';
import 'history_screen.dart';
import 'history_viewmodel.dart';

class HistoryView extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => HistoryView());

  @override
  Widget build(BuildContext context) {
    return View<HistoryViewmodel>(
        builder: (_, vm, __) =>
            vm.user != null ? HistoryScreen() : HomeViewUnloggedIn());
  }
}
