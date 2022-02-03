import 'dart:async';
import '../../services/user/user_repository.dart';
import '../viewmodel.dart';
import '../../app/service_locator.dart';
import '../../services/user/user_service.dart';
import '../../models/user.dart';

class ProfileViewmodel extends Viewmodel {
  final _service = locator<UserService>();
  List<User> _listUser;

  StreamSubscription _streamObserver;
  bool get isObservingStream => _streamObserver != null;

  final UserRepository _userRepository = locator();
  User get user => _userRepository.user;

  HistoryViewmodel() {
    _userRepository.addListener(() {
      if (user == null) {
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

        _listUser = await _service.fetchUsers();
        _streamObserver = _service.observeStream(
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

  int get dataCount => _listUser == null ? 0 : _listUser.length;

  Future<void> addUser(User user) async => await update(() async {
        if (user == null) return;

        final User dbUser = await _service.addUser(user);

        // The flag is meant for preventing duplicate update on the viewmodel state, in case
        // linking to a stream, like in the case of firestore

        if (!isObservingStream) _listUser.add(dbUser);
      });

  Future<void> removeUser(dynamic id) async => await update(() async {
        await _service.removeUser(id);
        _listUser.removeWhere((user) => user.uid == id);
      });

  Future<void> updateUser({dynamic id, User data}) async =>
      await update(() async {
        final User dbUser = await _service.updateUser(id: id, data: data);
        final index = _listUser.indexWhere((user) => user.uid == dbUser.uid);
        if (index == -1) return;

        if (!isObservingStream) _listUser[index] = dbUser;
      });

  User getUser(int index) => _listUser == null ? null : _listUser[index];

  Future<void> signOut() async {
    _streamObserver?.cancel();
    _streamObserver = null;
    _listUser = null;
    await _userRepository.signOut();
  }
}
