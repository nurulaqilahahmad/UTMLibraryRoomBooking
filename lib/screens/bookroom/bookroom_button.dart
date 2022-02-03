import 'package:flutter/material.dart';
import 'bookroom_screen.dart';
import 'bookroom_viewmodel.dart';

class BookRoomButton extends StatelessWidget {
  final BookRoomViewmodel viewmodel;
  final BookRoomScreenState state;
  const BookRoomButton({this.viewmodel, this.state});

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
          child: Text('BOOK'),
          onPressed: () => state.onBook(viewmodel),
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
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            onSurface: Colors.transparent,
            primary: Colors.red[900],
          ),
          child: Text('CLEAR'),
          onPressed: () => state.onClear(viewmodel),
        ),
      ],
    );
  }
}
