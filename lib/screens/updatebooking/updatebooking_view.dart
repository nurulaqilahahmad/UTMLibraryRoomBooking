import 'package:flutter/material.dart';
import '../../models/booking.dart';
import '../home/home_view_unlogged_in.dart';
import '../view.dart';
import 'updatebooking_screen.dart';
import 'updatebooking_viewmodel.dart';

class UpdateBookingView extends StatelessWidget {
  const UpdateBookingView(this.booking);

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return View<UpdateBookingViewmodel>(
        builder: (_, vm, __) => vm.user != null
            ? UpdateBookingScreen(booking)
            : HomeViewUnloggedIn());
  }
}
