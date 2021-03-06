import 'dart:async';
import '../../app/service_locator.dart';
import '../../models/booking.dart';
import '../../models/room.dart';
import '../../models/user.dart';
import '../../services/booking/booking_service.dart';
import '../../services/room/room_service.dart';
import '../../services/user/user_repository.dart';
import '../viewmodel.dart';

class BookRoomViewmodel extends Viewmodel {
  List<Booking> _listBooking = [];
  final BookingService _service = locator();
  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;

  List<Room> _list = [];
  final RoomService _serviceRoom = locator();
  StreamSubscription _streamObserverRoom;
  bool get isObservingStreamRoom => _streamObserverRoom != null;

  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  BookRoomViewmodel() {
    _userRepository.addListener(() {
      if (user == null) {
        _listBooking = null;
        _list = null;
      } else {
        init();
        //(_user != null) Navigator.pop(context, _user);
      }
      notifyListeners();
    });
  }

  @override
  void init() async => await update(() async {
        if (user == null) return;

        _list = await _serviceRoom.fetchRooms();
        _streamObserverRoom = _serviceRoom.observeStream(
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
    _streamObserverRoom?.cancel();
    _streamObserverRoom = null;
    super.dispose();
  }

    int get dataCount => _list == null ? 0 : _list.length;

    Room getRoom(int index) => _list == null ? null : _list[index];

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
