import 'package:flutter/material.dart';
import 'package:setup_mvvm/models/booking.dart';
import '../history/history_view.dart';
import 'updatebooking_body.dart';
import 'updatebooking_endDrawer.dart';
import 'updatebooking_viewmodel.dart';
import 'updatebooking_appbar.dart';
import 'updatebooking_drawer.dart';

class UpdateBookingScreen extends StatefulWidget {
  const UpdateBookingScreen(this.booking);
  final Booking booking;

  @override
  UpdateBookingScreenState createState() => UpdateBookingScreenState(booking);
}

class UpdateBookingScreenState extends State<UpdateBookingScreen> {
  UpdateBookingScreenState(this.booking);
  final Booking booking;

  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final roomController = TextEditingController();

  String get date => dateController.text;
  String get startTime => startTimeController.text;
  String get endTime => endTimeController.text;
  String get room => roomController.text;

  void onCancel() => Navigator.pop(context, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UpdateBookingDrawer(),
      appBar: UpdateBookingAppbar(),
      body: UpdateBookingBody(this, booking),
      endDrawer: UpdateBookingEndDrawer(),
    );
  }
}
