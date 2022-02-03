import 'package:flutter/material.dart';
import 'approvebooking_appbar.dart';
import 'approvebooking_body.dart';
import 'approvebooking_drawer.dart';

class ApproveBookingScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => ApproveBookingScreen());

  @override
  _ApproveBookingScreenState createState() => _ApproveBookingScreenState();
}

class _ApproveBookingScreenState extends State<ApproveBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ApproveBookingAppbar(),
      body: ApproveBookingBody(),
      endDrawer: ApproveBookingDrawer(),
    );
  }
}
