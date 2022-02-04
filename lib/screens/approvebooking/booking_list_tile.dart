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
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date:\t${booking.date}'),
                        Text(
                            'Time:\t${booking.startTime} - ${booking.endTime}'),
                        Row(
                          children: [
                            Text('Status:\t'),
                            booking.approve == true
                                ? Text(
                                    'APPROVED',
                                    style: TextStyle(color: Colors.green),
                                  )
                                : Text(
                                    'PENDING',
                                    style: TextStyle(color: Colors.red),
                                  )
                          ],
                        ),
                      ],
                    ),
                    trailing: booking.approve == true
                        ? IconButton(
                            icon: Icon(Icons.check_box, color: Colors.green, size: 30.0),
                            //onPressed: () => UpdateBookingView(_index),
                            onPressed: () {},
                          )
                        : IconButton(
                            icon: Icon(Icons.check_box, size: 30.0),
                            //onPressed: () => UpdateBookingView(_index),
                            onPressed: () {},
                          ),
                  ),
                ),
              ],
            ));
  }
}
