import 'dart:async';

import '../../models/user.dart';
import '../../app/service_locator.dart';
import '../../services/room/room_service.dart';
import '../../models/room.dart';
import '../viewmodel.dart';
import '../../services/user/user_repository.dart';

class AdminHomeViewmodel extends Viewmodel {
  List<Room> _list = [];
  final RoomService _service = locator();
  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;

  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  AdminHomeViewmodel() {
    _userRepository.addListener(() {
      if (user == null) {
        _list = null;
      } else {
        init();
      }
      notifyListeners();
    });
  }

  @override
  void init() async => await update(() async {
        if (user == null) return;

        _list = await _service.fetchRooms();
        _streamObserver = _service.observeStream(
            onData: (receivedData) async => await update(() async => _list =
                (receivedData.docs as List)
                    .map((doc) => Room.fromJson(doc.data()))
                    .toList()),
            onError: (e) => print(e));

        super.init();
      });

  @override
  void dispose() {
    _streamObserver?.cancel();
    _streamObserver = null;
    super.dispose();
  }

  int get dataCount => _list == null ? 0 : _list.length;

  Future<void> addRoom(Room room) async => await update(() async {
        if (user == null) return;

        final Room dbRoom = await _service.addRoom(room);

        // The flag is meant for preventing duplicate update on the viewmodel state, in case
        // linking to a stream, like in the case of firestore

        if (!isObservingStream) _list.add(dbRoom);
      });

  Future<void> deleteRoom(dynamic id) async => await update(() async {
        await _service.deleteRoom(id);
        _list.removeWhere((room) => room.id == id);
      });

  Future<void> updateRoom({dynamic id, Room data}) async =>
      await update(() async {
        final Room dbRoom = await _service.updateRoom(id: id, data: data);
        final index = _list.indexWhere((room) => room.id == dbRoom.id);
        if (index == -1) return;

        if (!isObservingStream) _list[index] = dbRoom;
      });

  Room getRoom(int index) => _list == null ? null : _list[index];

  Future<void> signOut() async {
    _streamObserver?.cancel();
    _streamObserver = null;
    _list = null;
    await _userRepository.signOut();
  }
}
