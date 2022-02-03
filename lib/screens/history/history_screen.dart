import 'package:flutter/material.dart';
import '../../models/booking.dart';
import 'history_appbar.dart';
import 'history_body.dart';
import 'history_drawer.dart';
import 'history_endDrawer.dart';
import 'history_view.dart';
import 'history_viewmodel.dart';

class HistoryScreen extends StatelessWidget {
//   @override
//   HistoryScreenState createState() => HistoryScreenState();
// }

// class HistoryScreenState extends State<HistoryScreen> {
//   final dateController = TextEditingController();
//   final startTimeController = TextEditingController();
//   final endTimeController = TextEditingController();
//   final roomController = TextEditingController();

//   String get date => dateController.text;
//   String get startTime => startTimeController.text;
//   String get endTime => endTimeController.text;
//   String get room => roomController.text;

//   void onUpdate(HistoryViewmodel viewmodel) async {
//     await viewmodel.updateBooking(Booking(
//         date: date,
//         startTime: startTime,
//         endTime: endTime,
//         approve: false,
//         room: room));

//     Navigator.push(context, HistoryView.route());
//   }

//   void onCancel() => Navigator.pop(context, null);

//   void onClear(HistoryViewmodel viewmodel) {
//     dateController.clear();
//     startTimeController.clear();
//     endTimeController.clear();
//     roomController.clear();
//     // viewmodel.errorMessage = null;
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HistoryDrawer(),
      appBar: HistoryAppbar(),
      body: HistoryBody(),
      endDrawer: HistoryEndDrawer(),
    );
  }
}
