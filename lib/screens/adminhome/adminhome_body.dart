// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../view.dart';
import 'adminhome_viewmodel.dart';
import 'room_list_tile.dart';

class AdminHomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectorView<AdminHomeViewmodel, int>(
        showProgressIndicator: false,
        selector: (_, vm) => vm.dataCount,
        builder: (_, vm, __, ___) => ListView.separated(
          itemCount: vm.dataCount,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (_, index) => RoomListTile(index),
        ),
      ),
    );

    // return View<AdminHomeViewmodel>(
    //   builder: (_, vm, __) => Center(
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
    //       child: Column(
    //         children: const [
    //           Text(
    //             "Welcome to",
    //             style: TextStyle(
    //               fontSize: 26.0,
    //               fontWeight: FontWeight.w600,
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 10.0,
    //           ),
    //           Image(image: AssetImage('assets/utm-library-logo.png')),
    //           // Icon(Icons.library_books),
    //           const SizedBox(
    //             height: 10.0,
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
