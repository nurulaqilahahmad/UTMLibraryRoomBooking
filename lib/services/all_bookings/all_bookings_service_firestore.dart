// @dart=2.9

import 'dart:async';
import 'package:setup_mvvm/services/authentication/authentication_service_firebase.dart';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../firebase.dart';
import 'all_bookings_service.dart';
import '../../models/booking.dart';
import '../../models/user.dart';

class AllBookingsServiceFirestore extends AllBookingsService {
  // static const String _userId = 'f5SZ0PqMGtRUHT8NdsIqK2BEPWf2';
  String get _userId => user.uid;
  final _idGenerator = Uuid();
  final _firestore = Firestore();

  CollectionReference get _collection => _firestore.collection('bookings');

  DocumentReference _getBookingDocument(bookingId) =>
      _firestore.document('bookings/$_userId/items/$bookingId');

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
    final u = await _getBookingDocument(uid).get();
    return User.fromJson(u.data());
  }

  @override
  Future<List<Booking>> fetchBookings() async {
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      final booking = Booking.fromJson(doc
          .data()); // transform data. Field id might be null, so take the doc id instead
      return booking;
    }).toList();
  }

  @override
  Future<Booking> getBooking(id) async {
    final b = await _getBookingDocument(id).get();
    return Booking.fromJson(b.data());
  }

  // @override
  // Future<Booking> getAllBookings() async {
  //   List _listUser = [];
  //   final allBookings = await _collection.get().then((QuerySnapshot) {
  //     QuerySnapshot.docs.forEach((element) {
  //       _listUser.add(element.data);
  //     });
  //   });
  //   return allBookings;
  // }

  @override
  Future<Booking> updateBooking({id, Booking data}) async {
    final update = data.copyWith(id: id);
    await _getBookingDocument(id).update(update.toJson());
    return update;
  }

  @override
  Future<void> removeBooking(id) async {
    await _getBookingDocument(id).delete();
  }

  @override
  Future<Booking> addBooking(Booking data) async {
    final _id = _idGenerator.v1(); // Generate time-based id
    final _data = data.copyWith(id: _id); // add generated id the data
    await _collection.doc('$_id').set(_data.toJson());
    return _data;
  }
}
