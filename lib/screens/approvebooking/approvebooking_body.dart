import 'package:flutter/material.dart';

import '../view.dart';
import 'approvebooking_viewmodel.dart';
import 'booking_list_tile.dart';

class ApproveBookingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectorView<ApproveBookingViewmodel, int>(
        showProgressIndicator: false,
        selector: (_, vm) => vm.dataCount,
        builder: (_, vm, __, ___) => ListView.separated(
          itemCount: vm.dataCount,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (_, index) => BookingListTile(index),
        ),
      ),
    );
  }
}
