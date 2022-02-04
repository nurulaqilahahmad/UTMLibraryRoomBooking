import 'package:flutter/material.dart';
import 'package:setup_mvvm/screens/adminhome/adminhome_view.dart';

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
      selector: (context, vm) => vm.getRoom(_index),
      builder: (context, vm, room, __) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300,
            height: 250,
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
                      subtitle: Column(
                        children: [
                          Text(
                            '${room.name}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Capacity: ${room.capacity}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onSurface: Colors.transparent,
                              primary: Colors.green,
                            ),
                            child: Text(
                              'Status: AVAILABLE',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              vm.updateRoom(
                                  id: room.id,
                                  data: Room(
                                      id: room.id,
                                      name: room.name,
                                      capacity: room.capacity,
                                      status: false,
                                      image: room.image));
                              Navigator.push(context, AdminHomeView.route());
                            },
                          ),
                        ],
                      ),
                    )
                  : ListTile(
                      title: Image(
                          image: AssetImage('assets/notavailable.jpg'),
                          width: 149.0,
                          height: 149.0),
                      subtitle: Column(
                        children: [
                          Text(
                            '${room.name}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Capacity: ${room.capacity}',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              onSurface: Colors.transparent,
                              primary: Colors.red,
                            ),
                            child: Text(
                              'Status: NOT AVAILABLE',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              vm.updateRoom(
                                  id: room.id,
                                  data: Room(
                                      id: room.id,
                                      name: room.name,
                                      capacity: room.capacity,
                                      status: true,
                                      image: room.image));
                              Navigator.push(context, AdminHomeView.route());
                            },
                          ),
                        ],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
