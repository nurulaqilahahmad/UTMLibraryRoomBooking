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
      builder: (context, vm, room, __) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300,
            height: 200,
            alignment: Alignment.center,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.red[900],
              child: room.status == true
                  ? ListTile(
                      title: Image(
                          image: AssetImage('${room.image}'),
                          width: 149.0,
                          height: 149.0),

                      subtitle: Text(
                        '${room.name}\nCapacity: ${room.capacity}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(color: Colors.black),
                      // Card(
                      //   color: Colors.white,
                      //   margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                      //   child: ListTile(
                      //     title: Image(image: AssetImage('${room.image}')),
                      //     subtitle: Text(
                      //       '${room.name}\nCapacity: ${room.capacity}',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(color: Colors.black),
                      //     ),
                      //   ),
                      // ),
                    )
                  : ListTile(
                      title: Image(
                          image: AssetImage('assets/notavailable.jpg'),
                          width: 149.0,
                          height: 149.0),
                      subtitle: Text(
                        '${room.name}\nCapacity: ${room.capacity}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
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
 
