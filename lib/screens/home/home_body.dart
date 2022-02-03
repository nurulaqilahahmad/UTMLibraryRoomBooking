// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../bookroom/bookroom_view.dart';
import '../history/history_view.dart';
import '../view.dart';
import 'home_viewmodel.dart';
import 'room_list_tile.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
        child: View<HomeViewmodel>(
          builder: (_, vm, __) => Expanded(
            child: Column(
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Image(image: AssetImage('assets/utm-library-logo.png')),
                // Icon(Icons.library_books),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: vm.dataCount,
                    itemBuilder: (_, index) => RoomListTile(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// return TabBarView(
//       children: [
//         Container(
//           child: Center(
//             child: SelectorView<HomeViewmodel, int>(
//               showProgressIndicator: false,
//               selector: (_, vm) => vm.dataCount,
//               builder: (_, vm, __, ___) => ListView.separated(
//                 itemCount: vm.dataCount,
//                 separatorBuilder: (_, __) => Divider(),
//                 itemBuilder: (_, index) => RoomListTile(index),
//               ),
//             ),
//           ),
//         ),
//         BookRoomView(),
//         HistoryView(),
//         Container(
//           child: Text('Profile'),
//         ),
//       ],
//     );
