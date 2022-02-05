import 'package:flutter/material.dart';

import '../../models/room.dart';
import 'updatebooking_viewmodel.dart';
import '../view.dart';

class AvailableRoomListTile extends StatelessWidget {
  final int _index;
  const AvailableRoomListTile(this._index);

  @override
  Widget build(BuildContext context) {
    return SelectorView<UpdateBookingViewmodel, Room>(
      showProgressIndicator: false,
      selector: (context, vm) => vm.getRoom(_index),
      builder: (context, vm, room, __) => Row(
        children: [
          Icon(Icons.circle, size: 15.0, color: room.status == true ? Colors.green : Colors.red,),
          Text('\t\t${room.name}', style: room.status == true ? TextStyle(color: Colors.black) : TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}