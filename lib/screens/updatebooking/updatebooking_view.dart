import 'package:flutter/material.dart';
import '../home/home_view_unlogged_in.dart';
import '../view.dart';
import 'updatebooking_screen.dart';
import 'updatebooking_viewmodel.dart';

class UpdateBookingView extends StatelessWidget {
  const UpdateBookingView(this._index);

  final int _index;

  @override
  Widget build(BuildContext context) {
    return View<UpdateBookingViewmodel>(
        builder: (_, vm, __) => vm.user != null
            ? UpdateBookingScreen(_index)
            : HomeViewUnloggedIn());
  }
}
