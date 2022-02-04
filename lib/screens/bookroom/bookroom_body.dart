// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../view.dart';
import 'available_room_list_tile.dart';
import 'bookroom_screen.dart';
import 'bookroom_viewmodel.dart';
import 'bookroom_button.dart';

class BookRoomBody extends StatelessWidget {
  final BookRoomScreenState _state;

  BookRoomBody(this._state);
  String current;

  @override
  Widget build(BuildContext context) {
    return View<BookRoomViewmodel>(
      builder: (context, viewmodel, _) => Center(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                      "Book A Room",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    _bookroom('Date', 'DD/MM/YYYY', _state.dateController),
                    _bookroom('From', 'HH:MM', _state.startTimeController),
                    _bookroom('To', 'HH:MM', _state.endTimeController),
                    _bookroom(
                        'Room', 'eg: Discussion Room', _state.roomController),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text('Room List', textAlign: TextAlign.center,),
                        subtitle: Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 20,
                            ),
                            itemCount: viewmodel.dataCount,
                            itemBuilder: (context, index) =>
                                AvailableRoomListTile(index),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    BookRoomButton(
                      viewmodel: viewmodel,
                      state: _state,
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}

Widget _bookroom(String title, String hint, TextEditingController state) {
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
