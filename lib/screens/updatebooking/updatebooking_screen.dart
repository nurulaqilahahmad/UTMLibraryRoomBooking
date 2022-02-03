import 'package:flutter/material.dart';
import 'package:setup_mvvm/models/booking.dart';
import 'package:setup_mvvm/screens/updatebooking/updatebooking_view.dart';
import 'updatebooking_body.dart';
import 'updatebooking_endDrawer.dart';
import 'updatebooking_viewmodel.dart';
import 'updatebooking_appbar.dart';
import 'updatebooking_drawer.dart';

class UpdateBookingScreen extends StatefulWidget {
  const UpdateBookingScreen(this._index);
  final int _index;

  @override
  UpdateBookingScreenState createState() => UpdateBookingScreenState(_index);
}

class UpdateBookingScreenState extends State<UpdateBookingScreen> {
  UpdateBookingScreenState(this._index);
  final int _index;

  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final roomController = TextEditingController();

  String get date => dateController.text;
  String get startTime => startTimeController.text;
  String get endTime => endTimeController.text;
  String get room => roomController.text;

  void onUpdate(UpdateBookingViewmodel viewmodel) async {
    await viewmodel.updateBooking(
        data: Booking(
            date: date,
            startTime: startTime,
            endTime: endTime,
            approve: false,
            room: room));
  }

  void onCancel() => Navigator.pop(context, null);

  // void onDelete(UpdateBookingViewmodel viewmodel) {
  //   viewmodel.removeBooking();
  //   // dateController.clear();
  //   // startTimeController.clear();
  //   // endTimeController.clear();
  //   // viewmodel.errorMessage = null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UpdateBookingDrawer(),
      appBar: UpdateBookingAppbar(),
      body: UpdateBookingBody(this, _index),
      endDrawer: UpdateBookingEndDrawer(),
    );
  }
}
