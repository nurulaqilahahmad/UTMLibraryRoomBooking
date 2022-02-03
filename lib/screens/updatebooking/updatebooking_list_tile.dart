import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/updatebooking/updatebooking_screen.dart';
import 'updatebooking_button.dart';
import 'updatebooking_viewmodel.dart';
import '../../models/booking.dart';
import '../view.dart';

class UpdateBookingListTile extends StatelessWidget {
  const UpdateBookingListTile(this._state, this._index);
  final UpdateBookingScreenState _state;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<UpdateBookingViewmodel, Booking>(
        showProgressIndicator: false,
        selector: (context, vm) => vm.getBooking(this._index),
        builder: (context, vm, booking, __) => Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Update Booking",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26.0,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                _updateBooking(
                    'Date', '${booking.date}', _state.dateController),
                _updateBooking(
                    'From', '${booking.startTime}', _state.startTimeController),
                _updateBooking(
                    'To', '${booking.endTime}', _state.endTimeController),
                _updateBooking(
                    'Room', '${booking.room}', _state.roomController),
                SizedBox(
                  height: 30.0,
                ),
                UpdateBookingButton(viewmodel: vm, state: _state),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      onSurface: Colors.transparent,
                      primary: Colors.red[900],
                    ),
                    child: Text('DELETE'),
                    onPressed: () =>
                        vm.removeBooking(vm.getBooking(_index).id)),
              ],
            ));
  }
}

Widget _updateBooking(String title, String hint, TextEditingController state) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          height: 3.0,
        ),
      ),
      TextField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          hintText: hint,
        ),
        controller: state,
      ),
      SizedBox(
        height: 10.0,
      ),
    ],
  );
}

Text _title(String title) {
  return Text(
    title,
    textAlign: TextAlign.start,
    style: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      height: 3.0,
    ),
  );
}
