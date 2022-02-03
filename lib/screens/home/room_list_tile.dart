import 'package:flutter/material.dart';

import '../../models/room.dart';
import 'home_viewmodel.dart';
import '../view.dart';
import '../ui_utils.dart';

class RoomListTile extends StatelessWidget {
  final int _index;
  const RoomListTile(this._index);

  @override
  Widget build(BuildContext context) {
    return SelectorView<HomeViewmodel, Room>(
      showProgressIndicator: false,
      selector: (_, vm) => vm.getRoom(_index),
      builder: (context, vm, room, __) => 
      Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // const SizedBox(height: 50.0),
                // Text("History", style: TextStyle(fontSize: 30.0)),
                // const SizedBox(height: 10.0),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      title: Text('(Image)'),
                      subtitle: Text(
                          '${room.name}\nCapacity: ${room.capacity}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black
                          ),),
                      ),
                    ),
              ],
                    ),
      // ListTile(
      //   title: Text('${room.name}'),
      //   subtitle: Text('Capacity: ${room.capacity}'),
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
      // ),
    );
  }
}
