import 'package:flutter/material.dart';
import '../updatebooking/updatebooking_view.dart';
import 'history_viewmodel.dart';
import '../../models/booking.dart';
import '../view.dart';

class HistoryListTile extends StatelessWidget {
  const HistoryListTile(this._index);
  final int _index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<HistoryViewmodel, Booking>(
        showProgressIndicator: false,
        selector: (context, vm) => vm.getBooking(_index),
        builder: (context, vm, booking, __) => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // const SizedBox(height: 50.0),
                // Text("History", style: TextStyle(fontSize: 30.0)),
                // const SizedBox(height: 10.0),
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
                        ? null
                        : IconButton(
                            icon: Icon(Icons.edit),
                            //onPressed: () => UpdateBookingView(_index),
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateBookingView(booking))),
                          ),
                  ),
                ),
              ],
            ));
  }
}
        
        // builder: (context, vm, booking, __) =>ListTile(
        //       title: Text('${booking.room}'),
        //       subtitle: Text(
        //           'Date: ${booking.date}\nTime: ${booking.startTime} - ${booking.endTime}'),
        //       // onTap: () => UpdateBookingView(_index),
        //       trailing: IconButton(
        //         icon: Icon(Icons.edit),
        //         onPressed: () => UpdateBookingView(_index),
        //       ),
        //     ));
