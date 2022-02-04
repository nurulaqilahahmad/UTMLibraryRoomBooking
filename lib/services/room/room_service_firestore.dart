// @dart=2.9

import 'dart:async';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase.dart';
import 'room_service.dart';
import '../../models/room.dart';

class RoomServiceFirestore extends RoomService {
  // static const String _userId = 'hm2leHyBDdYoMxF8hyqceJrs9rF2';
  String get _userId => user.uid;
  final _idGenerator = Uuid();
  final _firestore = Firestore();

  CollectionReference get _collection => _firestore.collection('rooms');

  DocumentReference _getRoomDocument(roomId) =>
      _firestore.document('rooms/$roomId');

  @override
  Stream get stream => _collection.snapshots();

  @override
  Future<List<Room>> fetchRooms() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      final room = Room.fromJson(doc.data()).copyWith(
          id: doc
              .id); // transform data. Field id might be null, so take the doc id instead
      return room;
    }).toList();
  }

  @override
  Future<Room> getRoom(id) async {
    final r = await _getRoomDocument(id).get();
    return Room.fromJson(r.data());
  }

  @override
  Future<Room> updateRoom({id, Room data}) async {
    final update = data.copyWith(id: id);
    await _getRoomDocument(id).update(update.toJson());
    return update;
  }

  @override
  Future<void> deleteRoom(id) async {
    await _getRoomDocument(id).delete();
  }

  @override
  Future<Room> addRoom(Room data) async {
    final _id = _idGenerator.v1(); // Generate time-based id
    final _data = data.copyWith(id: _id); // add generated id the data
    await _collection.doc('$_id').set(_data.toJson());
    return _data;
  }
}
