// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../home/home_view_unlogged_in.dart';
import '../view.dart';
import 'approvebooking_screen.dart';
import 'approvebooking_viewmodel.dart';

class ApproveBookingView extends StatelessWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => ApproveBookingView());

  @override
  Widget build(BuildContext context) {
    return View<ApproveBookingViewmodel>(
        builder: (_, vm, __) =>
            vm.user != null ? ApproveBookingScreen() : HomeViewUnloggedIn());
  }
}
