import 'package:flutter/material.dart';

import '../../models/room.dart';
import 'adminhome_viewmodel.dart';
import '../view.dart';
import '../ui_utils.dart';

class RoomListTile extends StatelessWidget {
  final int _index;
  const RoomListTile(this._index);

  @override
  Widget build(BuildContext context) {
    return SelectorView<AdminHomeViewmodel, Room>(
      showProgressIndicator: false,
      selector: (_, vm) => vm.getRoom(_index),
      builder: (context, vm, room, __) => ListTile(
        title: Text('${room.name}'),
        subtitle: Text('Capacity: ${room.capacity}'),
        // subtitle:
        //     Text('Tap to change number randomly and long pressed to delete'),
        // // Delete an item on long press
        // onLongPress: () => showSnackBarWhenError(
        //     context, () => vm.deleteRoom(vm.getRoom(_index).id)),

        // // Update to a new random number on tap
        // onTap: () => showSnackBarWhenError(
        //     context,
        //     () => vm.updateRoom(
        //         id: vm.getRoom(_index).id,
        //         data: Room(value: rnd.nextInt(200)))),
      ),
    );
  }
}
