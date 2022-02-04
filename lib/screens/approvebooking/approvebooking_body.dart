import 'package:flutter/material.dart';

import '../view.dart';
import 'approvebooking_viewmodel.dart';
import 'booking_list_tile.dart';

class ApproveBookingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: View<ApproveBookingViewmodel>(
        builder: (_, vm, __) => Center(
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              SizedBox(
                height: 50.0,
                child:
                    Text("Approve Booking", style: TextStyle(fontSize: 30.0)),
              ),
              const SizedBox(height: 10.0),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: vm.dataCount,
                  itemBuilder: (_, index) => BookingListTile(index),
                ),
              ),
            ],
          ),
        ),
      ),
      //),
    );
  }
}
