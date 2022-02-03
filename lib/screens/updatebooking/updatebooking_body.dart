// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../view.dart';
import 'updatebooking_list_tile.dart';
import 'updatebooking_screen.dart';
import 'updatebooking_viewmodel.dart';
import 'updatebooking_button.dart';
import '../../models/booking.dart';

class UpdateBookingBody extends StatelessWidget {
  const UpdateBookingBody(this._state, this._index);
  final UpdateBookingScreenState _state;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectorView<UpdateBookingViewmodel, Booking>(
        showProgressIndicator: false,
        selector: (context, vm) => vm.getBooking(this._index),
        builder: (context, vm, booking, __) => ListView.separated(
          itemCount: vm.dataCount,
          separatorBuilder: (_, __) => Divider(
            color: Colors.black,
          ),
          itemBuilder: (_, index) => UpdateBookingListTile(_state, _index),
        ),
      ),
    );
  }
}
