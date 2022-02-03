import 'package:flutter/material.dart';
import '../../models/booking.dart';
import '../../screens/history/history_appbar.dart';
import '../history/history_view.dart';
import 'bookroom_appbar.dart';
import 'bookroom_body.dart';
import 'bookroom_drawer.dart';
import 'bookroom_endDrawer.dart';
import 'bookroom_viewmodel.dart';

class BookRoomScreen extends StatefulWidget {
  @override
  BookRoomScreenState createState() => BookRoomScreenState();
}

class BookRoomScreenState extends State<BookRoomScreen> {
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final roomController = TextEditingController();

  String get date => dateController.text;
  String get startTime => startTimeController.text;
  String get endTime => endTimeController.text;
  String get room => roomController.text;

  void onBook(BookRoomViewmodel viewmodel) async {
    await viewmodel.addBooking(Booking(
        date: date,
        startTime: startTime,
        endTime: endTime,
        approve: false,
        room: room));

    Navigator.push(context, HistoryView.route());
  }

  void onCancel() => Navigator.pop(context, null);

  void onClear(BookRoomViewmodel viewmodel) {
    dateController.clear();
    startTimeController.clear();
    endTimeController.clear();
    roomController.clear();
    // viewmodel.errorMessage = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BookRoomDrawer(),
      appBar: BookRoomAppbar(),
      body: BookRoomBody(this),
      endDrawer: BookRoomEndDrawer(),
    );
  }
}