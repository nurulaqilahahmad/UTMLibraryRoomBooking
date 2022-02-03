// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../view.dart';
import 'bookroom_screen.dart';
import 'bookroom_viewmodel.dart';
import 'bookroom_button.dart';

class BookRoomBody extends StatelessWidget {
  final BookRoomScreenState _state;

  BookRoomBody(this._state);

  int _value = 1;
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
                      height: 30.0,
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

// DropdownButton _dropdown(String title, List list, String current) {
//   return DropdownButton(
//       hint: Text(title),
//       items: list.map((listItem) {
//         return DropdownMenuItem(
//           value: listItem,
//           child: Text(listItem),
//         );
//       }).toList(),
//       onChanged: (value) {},);
// }


// Text _title(String title) {
//   return Text(
//     title,
//     textAlign: TextAlign.start,
//     style: TextStyle(
//       color: Colors.black,
//       fontSize: 20.0,
//       height: 3.0,
//     ),
//   );
// }


                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     _title('Date: '),
                    //     Row(
                    //       children: [
                    //         // _dropdown("Day", days, current),
                    //         // Text('\t\t/\t\t'),
                    //         // _dropdown("Month", months, current),
                    //         // Text('\t\t/\t\t'),
                    //         // _dropdown("Year", year, current),
                    //         _bookroom(
                    //             'Date', 'DD/MM/YYYY', _state.dateController)
                    //       ],
                    //     ),
                    //     _title('From: '),
                    //     Row(
                    //       children: [
                    //         // _dropdown("Hour", hour, current),
                    //         // Text('\t\t:\t\t'),
                    //         // _dropdown("Minutes", minute, current),
                    //         _bookroom('Start Time', 'HH:MM',
                    //             _state.startTimeController)
                    //       ],
                    //     ),
                    //     _title('To: '),
                    //     Row(
                    //       children: [
                    //         // _dropdown("Hour", hour, current),
                    //         // Text('\t\t:\t\t'),
                    //         // _dropdown("Minutes", minute, current),
                    //         _bookroom(
                    //             'End Time', 'HH:MM', _state.endTimeController)
                    //       ],
                    //     ),
                    //     // _title('Number of people: '),
                    //     // _dropdown("Number of people", numOfPeople),
                    //     _title('Available Room: '),
                    //     Column(
                    //       children: <Widget>[
                    //         RadioListTile(
                    //           title: Text('Carrel Room'),
                    //           value: 1,
                    //           groupValue: _value,
                    //           onChanged: (value) {},
                    //         ),
                    //         RadioListTile(
                    //           title: Text('Discussion Room'),
                    //           value: 2,
                    //           groupValue: _value,
                    //           onChanged: (value) {},
                    //         ),
                    //         RadioListTile(
                    //           title: Text('Seminar Room'),
                    //           value: 3,
                    //           groupValue: _value,
                    //           onChanged: (value) {},
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),

                    

  // List days = [
  //   "01",
  //   "02",
  //   "03",
  //   "04",
  //   "05",
  //   "06",
  //   "07",
  //   "08",
  //   "09",
  //   "10",
  //   "11",
  //   "12",
  //   "13",
  //   "14",
  //   "15",
  //   "16",
  //   "17",
  //   "18",
  //   "19",
  //   "20",
  //   "21",
  //   "22",
  //   "23",
  //   "24",
  //   "25",
  //   "26",
  //   "27",
  //   "28",
  //   "29",
  //   "30",
  //   "31"
  // ];

  // List months = [
  //   "01",
  //   "02",
  //   "03",
  //   "04",
  //   "05",
  //   "06",
  //   "07",
  //   "08",
  //   "09",
  //   "10",
  //   "11",
  //   "12"
  // ];

  // List year = ["2021", "2022", "2023"];

  // List hour = [
  //   "08",
  //   "09",
  //   "10",
  //   "11",
  //   "12",
  //   "13",
  //   "14",
  //   "15",
  //   "16",
  //   "17",
  // ];

  // List minute = [
  //   "05",
  //   "10",
  //   "15",
  //   "20",
  //   "25",
  //   "30",
  //   "35",
  //   "40",
  //   "45",
  //   "50",
  //   "55"
  // ];

  // List numOfPeople = ["1 - 3", "4 - 6", "7 - 10"];