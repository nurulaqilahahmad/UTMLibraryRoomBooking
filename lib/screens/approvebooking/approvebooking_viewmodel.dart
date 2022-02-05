import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user.dart';
import '../../app/service_locator.dart';
import '../../models/booking.dart';
import '../../services/booking/booking_service.dart';
import '../../services/firebase.dart';
import '../../services/user/user_service.dart';
import '../viewmodel.dart';
import '../../services/user/user_repository.dart';

class ApproveBookingViewmodel extends Viewmodel {
  List<Booking> _listBooking = [];
  final BookingService _service = locator();
  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;

  final _serviceUser = locator<UserService>();
  List<User> _listUser;
  StreamSubscription _streamObserverUser;
  bool get isObservingStreamUser => _streamObserverUser != null;

  final _firestore = Firestore();

  CollectionReference get _collection =>
      _firestore.collection('bookings');

  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  ApproveBookingViewmodel() {
    _userRepository.addListener(() {
      if (user == null) {
        _listBooking = null;
        _listUser = null;
      } else {
        init();
      }
      notifyListeners();
    });
  }

  @override
  void init() async => await update(() async {
        if (user == null) return;

        _listBooking = await _service.fetchBookings();
        _streamObserver = _service.observeStream(
            onData: (receivedData) async => await update(() async =>
                _listBooking = (receivedData.docs as List)
                    .map((doc) => Booking.fromJson(doc.data()))
                    .toList()),
            onError: (e) => print(e));

            _listUser = await _serviceUser.fetchUsers();
        _streamObserverUser = _serviceUser.observeStream(
            onData: (receivedData) async => await update(() async => _listUser =
                (receivedData.docs as List)
                    .map((doc) => User.fromJson(doc.data()))
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

  int get dataCount => _listBooking == null ? 0 : _listBooking.length;
  int get userDataCount => _listUser == null ? 0 : _listUser.length;

  Future fetchBookings() async{
    final snapshot = await _collection.get();
    return snapshot.docs.map((doc) {
      final booking = Booking.fromJson(doc.data()).copyWith(
          id: doc
              .id); // transform data. Field id might be null, so take the doc id instead
      return booking;
    }).toList();
  }

  Future<void> addBooking(Booking booking) async => await update(() async {
        if (user == null) return;

        final Booking dbBooking = await _service.addBooking(booking);

        // The flag is meant for preventing duplicate update on the viewmodel state, in case
        // linking to a stream, like in the case of firestore

        if (!isObservingStream) _listBooking.add(dbBooking);
      });

  Future<void> removeBooking(dynamic id) async => await update(() async {
        await _service.removeBooking(id);
        _listBooking.removeWhere((booking) => booking.id == id);
      });

  Future<void> updateBooking({dynamic id, Booking data}) async =>
      await update(() async {
        final Booking dbBooking =
            await _service.updateBooking(id: id, data: data);
        final index =
            _listBooking.indexWhere((booking) => booking.id == dbBooking.id);
        if (index == -1) return;

        if (!isObservingStream) _listBooking[index] = dbBooking;
      });

  Booking getBooking(int index) =>
      _listBooking == null ? null : _listBooking[index];

  User getUser(int index) => _listUser == null ? null : _listUser[index];

  // Future<List<Booking>> getAllBookings(int index) async {
  //   _listAllBookings = await _service.fetchBookings();
  //   return _listAllBookings;
  // }

  Future<void> signOut() async {
    _streamObserver?.cancel();
    _streamObserver = null;
    _listBooking = null;
    await _userRepository.signOut();
  }
}
