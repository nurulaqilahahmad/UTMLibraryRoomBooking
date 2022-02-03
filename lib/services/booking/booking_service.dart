import 'dart:async';

import '../../../../models/booking.dart';
import '../../app/service_locator.dart';
import '../../models/user.dart';
import '../user/user_repository.dart';

abstract class BookingService {
  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  Future<List<Booking>> fetchBookings();
  Future<Booking> getBooking(id);
  Future<Booking> updateBooking({id, Booking data});
  Future<void> removeBooking(id);
  Future<Booking> addBooking(Booking data);

  Stream get stream => null;

  StreamSubscription observeStream(
      {Function(dynamic) onData, Function onError, Function onDone}) {
    if (stream == null) return null;

    // in case the service also supports stream (like firestore), prepare a listener
    return stream.listen(onData, onError: onError, onDone: onDone);
  }
}
