import 'package:flutter/material.dart';

import '../../models/booking.dart';
import 'approvebooking_viewmodel.dart';
import '../view.dart';
// import '../ui_utils.dart';

class BookingListTile extends StatelessWidget {
  final int _index;
  const BookingListTile(this._index);

  @override
  Widget build(BuildContext context) {
    return SelectorView<ApproveBookingViewmodel, Booking>(
      showProgressIndicator: false,
      selector: (_, vm) => vm.getBooking(_index),
      builder: (context, vm, booking, __) => ListTile(
        title: Text('${booking.room}'),
        subtitle: Text(
            'Date: ${booking.date}\nTime: ${booking.startTime} - ${booking.endTime}'),
        trailing: IconButton(
            onPressed: () => vm.updateBooking(
                id: '${booking.id}',
                data: Booking(
                    id: '${booking.id}',
                    date: '${booking.date}',
                    startTime: '${booking.startTime}',
                    endTime: '${booking.endTime}',
                    approve: true)),
            icon: Icon(Icons.check)),
        // Delete an item on long press
        // onLongPress: () => showSnackBarWhenError(
        //     context, () => vm.removeBooking(vm.getBooking(_index).id)),

        // // Update to a new random number on tap
        // onTap: () => showSnackBarWhenError(
        //     context,
        //     () => vm.updateBooking(
        //         id: vm.getBooking(_index).id,
        //         data: Booking(value: rnd.nextInt(200)))),
      ),
    );
  }
}
