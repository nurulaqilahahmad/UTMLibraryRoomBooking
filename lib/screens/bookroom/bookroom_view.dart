// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../home/home_view_unlogged_in.dart';
import '../view.dart';
import 'bookroom_screen.dart';
import 'bookroom_viewmodel.dart';

class BookRoomView extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => BookRoomView());

  @override
  Widget build(BuildContext context) {
    return View<BookRoomViewmodel>(
        builder: (_, vm, __) =>
            vm.user != null ? BookRoomScreen() : HomeViewUnloggedIn());
  }
}
