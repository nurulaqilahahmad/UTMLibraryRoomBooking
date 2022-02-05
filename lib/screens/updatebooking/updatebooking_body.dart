// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/history/history_view.dart';
import 'available_room_list_tile.dart';
import '../view.dart';
import 'updatebooking_screen.dart';
import 'updatebooking_viewmodel.dart';
import '../../models/booking.dart';

class UpdateBookingBody extends StatelessWidget {
  const UpdateBookingBody(this._state, this.booking);
  final UpdateBookingScreenState _state;
  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return View<UpdateBookingViewmodel>(
      showProgressIndicator: false,
      // selector: (_, vm) => vm.getBooking(_index),
      builder: (context, vm, __) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: [
                  Text(
                    "Update Booking",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26.0,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  _updateBooking(
                      'Date', '${booking.date}', _state.dateController),
                  _updateBooking('From', '${booking.startTime}',
                      _state.startTimeController),
                  _updateBooking(
                      'To', '${booking.endTime}', _state.endTimeController),
                  _updateBooking(
                      'Room', '${booking.room}', _state.roomController),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    color: Colors.white,
                    child: ListTile(
                      title: Text(
                        'Room List',
                        textAlign: TextAlign.center,
                      ),
                      subtitle: Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 20,
                          ),
                          itemCount: vm.roomDataCount,
                          itemBuilder: (context, index) =>
                              AvailableRoomListTile(index),
                        ),
                      ),
                    ),
                  ),
                  if (vm.errorMessage != null)
                    Text(
                      vm.errorMessage,
                      style: TextStyle(color: Colors.red, fontSize: 20.0),
                    ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onSurface: Colors.transparent,
                          primary: Colors.red[900],
                        ),
                        child: Text('UPDATE'),
                        // onPressed: () => _state.onUpdate(vm),
                        onPressed: () {
                          vm.updateBooking(
                              id: booking.id,
                              data: Booking(
                                  id: booking.id,
                                  date: _state.dateController != null
                                      ? _state.date
                                      : booking.date,
                                  startTime: _state.startTimeController != null
                                      ? _state.startTime
                                      : booking.startTime,
                                  endTime: _state.endTimeController != null
                                      ? _state.endTime
                                      : booking.endTime,
                                  room: _state.roomController != null
                                      ? _state.room
                                      : booking.room,
                                  approve: false));
                          Navigator.push(context, HistoryView.route());
                        },
                      ),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onSurface: Colors.transparent,
                          primary: Colors.red[900],
                        ),
                        child: Text('CANCEL'),
                        onPressed: _state.onCancel,
                      ),
                      const SizedBox(width: 10.0),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onSurface: Colors.transparent,
                            primary: Colors.red[900],
                          ),
                          child: Text('DELETE'),
                          onPressed: () {
                            vm.removeBooking(booking.id);
                            Navigator.push(context, HistoryView.route());
                          }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
        controller: state == null ? hint : state,
      ),
      SizedBox(
        height: 10.0,
      ),
    ],
  );
}
