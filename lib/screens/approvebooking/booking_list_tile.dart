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
        selector: (context, vm) => vm.getBooking(_index),
        builder: (context, vm, booking, __) => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    title: Text('${booking.room}'),
                    subtitle: Text(
                        'Date: ${booking.date}\nTime: ${booking.startTime} - ${booking.endTime}'),
                    trailing: IconButton(
                        onPressed: () {},
                        // onPressed: () => vm.updateBooking(
                        //     id: '${booking.id}',
                        //     data: Booking(
                        //         id: '${booking.id}',
                        //         date: '${booking.date}',
                        //         startTime: '${booking.startTime}',
                        //         endTime: '${booking.endTime}',
                        //         approve: true)),
                        icon: Icon(Icons.check)),
                  ),
                ),
              ],
            ));
  }
}
