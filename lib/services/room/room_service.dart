import 'dart:async';

import '../../app/service_locator.dart';
import '../user/user_repository.dart';
import '../../models/user.dart';
import '../../models/room.dart';

abstract class RoomService {
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  Future<List<Room>> fetchRooms();
  Future<Room> getRoom(id);
  Future<Room> updateRoom({id, Room data});
  Future<void> deleteRoom(id);
  Future<Room> addRoom(Room data);

  // this getter is to be overidden, if the service supports stream such as firestore
  Stream get stream => null;

  StreamSubscription observeStream(
      {Function(dynamic) onData, Function onError, Function onDone}) {
    if (stream == null) return null;

    // in case the service also supports stream (like firestore), prepare a listener
    return stream.listen(onData, onError: onError, onDone: onDone);
  }
}
