import 'package:flutter/material.dart';
import 'updatebooking_screen.dart';
import 'updatebooking_viewmodel.dart';

class UpdateBookingButton extends StatelessWidget {
  const UpdateBookingButton({this.viewmodel, this.state});
  final UpdateBookingViewmodel viewmodel;
  final UpdateBookingScreenState state;
  //final int _index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onSurface: Colors.transparent,
            primary: Colors.red[900],
          ),
          child: Text('UPDATE'),
          onPressed: () => state.onUpdate(viewmodel),
        ),
        const SizedBox(width: 10.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onSurface: Colors.transparent,
            primary: Colors.red[900],
          ),
          child: Text('CANCEL'),
          onPressed: state.onCancel,
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }
}
