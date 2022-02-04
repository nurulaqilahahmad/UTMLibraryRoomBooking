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
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Welcome to",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
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
                      mainAxisExtent: 256,
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
