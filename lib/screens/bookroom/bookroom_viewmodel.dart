import 'dart:async';
import '../../app/service_locator.dart';
import '../../models/booking.dart';
import '../../models/user.dart';
import '../../services/booking/booking_service.dart';
import '../../services/user/user_repository.dart';
import '../viewmodel.dart';

class BookRoomViewmodel extends Viewmodel {
  List<Booking> _listBooking = [];
  final BookingService _service = locator();
  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;

  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  BookRoomViewmodel() {
    _userRepository.addListener(() {
      if (user == null) {
        _listBooking = null;
      } else {
        init();
        //(_user != null) Navigator.pop(context, _user);
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

  Future<void> addBooking(Booking booking) async => await update(() async {
        if (user == null) return;

        final Booking dbBooking = await _service.addBooking(booking);

        // The flag is meant for preventing duplicate update on the viewmodel state, in case
        // linking to a stream, like in the case of firestore

        if (!isObservingStream) _listBooking.add(dbBooking);
      });

  Future<void> signOut() async {
    _streamObserver?.cancel();
    _streamObserver = null;
    _listBooking = null;
    await _userRepository.signOut();
  }
}
