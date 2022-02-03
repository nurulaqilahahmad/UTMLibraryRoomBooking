// @dart=2.9

import 'dart:async';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase.dart';
import 'user_service.dart';
import '../../models/user.dart';

class UserServiceFirestore extends UserService {
  // static const String _userId = 'hm2leHyBDdYoMxF8hyqceJrs9rF2';
  String get _userId => user.uid;
  final _idGenerator = Uuid();
  final _firestore = Firestore();

  CollectionReference get _collection =>
      _firestore.collection('users/$_userId/items');

  DocumentReference _getRoomDocument(_profileId) =>
      _firestore.document('users/$_userId/items/');

  @override
  Stream get stream => _collection.snapshots();

  @override
  Future<List<User>> fetchUsers() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      final user = User.fromJson(doc.data()).copyWith(
          uid: doc
              .id); // transform data. Field id might be null, so take the doc id instead
      return user;
    }).toList();
  }

  @override
  Future<User> getUser(uid) async {
    final u = await _getRoomDocument(uid).get();
    return User.fromJson(u.data());
  }

  @override
  Future<User> updateUser({id, User data}) async {
    final update = data.copyWith(uid: id);
    await _getRoomDocument(id).update(update.toJson());
    return update;
  }

  @override
  Future<void> removeUser(uid) async {
    await _getRoomDocument(uid).delete();
  }

  @override
  Future<User> addUser(User data) async {
    final _id = _idGenerator.v1(); // Generate time-based id
    final _data = data.copyWith(uid: _id); // add generated id the data
    await _collection.doc('$_id').set(_data.toJson());
    return _data;
  }
}
