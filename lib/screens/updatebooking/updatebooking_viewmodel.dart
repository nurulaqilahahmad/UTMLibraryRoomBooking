import 'dart:async';

import '../../app/service_locator.dart';
import '../../models/booking.dart';
import '../../models/user.dart';
import '../../services/booking/booking_service.dart';
import '../../services/user/user_repository.dart';
import '../viewmodel.dart';

class UpdateBookingViewmodel extends Viewmodel {
  List<Booking> _listBooking = [];
  final BookingService _service = locator();
  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;

  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  UpdateBookingViewmodel() {
    _userRepository.addListener(() {
      if (user == null) {
        _listBooking = null;
      } else {
        init();
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _streamObserver?.cancel();
    _streamObserver = null;
    super.dispose();
  }

  int get dataCount => _listBooking == null ? 0 : _listBooking.length;

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

  Future<void> signOut() async {
    _streamObserver?.cancel();
    _streamObserver = null;
    _listBooking = null;
    await _userRepository.signOut();
  }
}
